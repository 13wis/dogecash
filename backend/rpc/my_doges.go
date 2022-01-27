package rpc

import (
	"context"
	"errors"

	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
)

func (s *DogecashServer) MyDoges(ctx context.Context,
	req *emptypb.Empty) (res *dogecash.MyDogesResponse, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}

	doges := []*dogecash.BaseDoge{}
	res = &dogecash.MyDogesResponse{Doges: doges}
	err = s.DB.Raw("? UNION ?",
		s.DB.Table("doges").
			Select("doges.*, m.interaction_type").
			Joins("JOIN my_doges m ON doges.id = m.dogee").
			Where("m.doger = ?", claims.DogeID),
		s.DB.Table("doges").
			Select("doges.*, m.interaction_type").
			Joins("JOIN my_doges m ON doges.id = m.doger").
			Where("m.dogee = ?", claims.DogeID),
	).Scan(&doges).
		Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return res, nil
		}

		return nil, GRPCError(ErrorCodeUnknown)
	}

	res.Doges = doges
	return
}
