package rpc

import (
	"context"
	"errors"
	"log"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
)

func (s *DogecashServer) UpdateExternalAccount(ctx context.Context,
	req *dogecash.UpdateExternalAccountRequest) (res *emptypb.Empty, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}
	if claims.AccountID == nil || claims.CustomerID == nil {
		return nil, GRPCError(ErrorCodeNoIndividual)
	}

	doge := &db.Doge{}
	if err := s.DB.First(&doge, "id = ?", claims.DogeID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeNoDoge)
		}

		return nil, GRPCError(ErrorCodeUnknown)
	}

	if err := tools.UpdateExternalAccount(*claims.AccountID, *claims.CustomerID, req); err != nil {
		if err != nil {
			return nil, GRPCError(ErrorCodeStripe)
		}
	}

	doge.ExternalAccountLinked = true
	if err := s.DB.Save(&doge).Error; err != nil {
		// We can't do anyting about this error but log it, in the future we should probably
		// implement some type of job to retry on error
		log.Println(err)
	}

	return new(emptypb.Empty), nil
}
