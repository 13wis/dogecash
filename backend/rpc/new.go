package rpc

import (
	"errors"
	"fmt"
	sync "sync"
	"time"

	"github.com/l3wis/dogecash/db"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"gorm.io/gorm"
)

type RemainingAmountExceededParams struct {
	Amount       int64
	DogeID       int64
	ActivityType *dogecash.Activity_ActivityType
	DB           *gorm.DB
}

func RemainingAmountExceeded(raep *RemainingAmountExceededParams) error {
	activities := []*db.Activity{}
	where := "source_id = ? AND activity_type = ? AND created > ?"
	lastWeek := time.Now().Add(-time.Hour * 24 * 7)
	err := raep.DB.Where(where, raep.DogeID, raep.ActivityType.String(), lastWeek).
		Find(&activities).
		Error
	if err != nil {
		if !errors.Is(err, gorm.ErrRecordNotFound) {
			return GRPCError(ErrorCodeUnknown)
		}
	}

	var total int64
	for _, activity := range activities {
		total += activity.Amount
	}
	if total > tools.MaximumAmount {
		return GRPCError(ErrorCodeMaxAddCashOrPayout)
	}
	if total+raep.Amount > tools.MaximumAmount {
		remaining := fmt.Sprint(tools.MaximumAmount - total)
		dollar := remaining[:len(remaining)-2]
		decimal := remaining[len(dollar):]
		message := "the amount you requested would exceed your remaining weekly max; "
		str := fmt.Sprintf(message+"please reduce amount to be less than $%s.%s.", dollar, decimal)
		return errors.New(str)
	}

	return nil
}

func Verify(hidden *db.HiddenDoge, match string) bool {
	if hidden != nil && hidden.VerificationHash != nil && *hidden.VerificationHash != "" {
		if hidden.HashExpiration != nil {
			hasNotExpired := time.Now().Unix() < *hidden.HashExpiration
			if valid := tools.CheckPasswordHash(match, *hidden.VerificationHash); valid && hasNotExpired {
				return true
			}
		}
	}

	return false
}

type DogecashServer struct {
	dogecash.UnimplementedDogecashServer

	mu sync.Mutex
	DB *gorm.DB
}

func NewServer(gorm *gorm.DB) dogecash.DogecashServer {
	return &DogecashServer{DB: gorm}
}
