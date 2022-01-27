package rpc

import (
	"context"
	"errors"
	"fmt"
	"log"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
)

func (s *DogecashServer) UpdateStripeInfo(ctx context.Context,
	req *dogecash.UpdateStripeInfoRequest) (res *emptypb.Empty, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}

	full := &db.FullDoge{}
	err = s.DB.Table("doges").
		Select("doges.*, h.*").
		Where("id = ?", claims.DogeID).
		Joins("JOIN hidden_doges h on doges.id = h.doge_id").
		First(&full).
		Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeNoDoge)
		}
		return nil, GRPCError(ErrorCodeUnknown)
	}
	accountId, err := tools.UpdateStripeInfo(full.Doge.Email, ctx, claims.AccountID, req)
	if err != nil {
		return nil, err
	}

	if req.Create {
		customerId, err := tools.CreateCustomer(full.Doge.Email)
		if err != nil {
			return nil, err
		}

		ncr := &dogecash.NewCardholderRequest{
			Line1: "100 N Tryon Street",
			City:  "Charlotte",
			State: "NC",
			Zip:   "28202",
			Phone: "+1-877-224-4669",
		}
		ichId, cardId, err := tools.CreateCardholder(*accountId, ncr)
		if err != nil {
			return nil, err
		}

		doge := &db.Doge{StripeAccountCreated: true}
		err = s.DB.Model(&db.Doge{}).
			Where("id = ?", full.Doge.ID).
			Updates(&doge).
			Error
		if err != nil {
			return nil, GRPCError(ErrorCodeUnknown)
		}

		hidden := &db.HiddenDoge{
			AccountID:  accountId,
			CustomerID: customerId,
			IchID:      ichId,
			CardID:     cardId,
		}
		err = s.DB.Model(&db.HiddenDoge{}).
			Where("id = ?", full.Doge.ID).
			Updates(&hidden).
			Error
		if err != nil {
			return nil, GRPCError(ErrorCodeUnknown)
		}

		params := &tools.SignJwtParams{
			AccountID:  accountId,
			CustomerID: customerId,
			DogeID:     claims.DogeID,
			Dogetag:    full.Doge.Dogetag,
			IchID:      ichId,
			CardID:     cardId,
		}
		token, err := tools.SignJwt(params)
		if err != nil || token == nil {
			log.Println(err.Error())
			return new(emptypb.Empty), nil
		}

		header := metadata.Pairs("Authorization", fmt.Sprintf("Bearer %s", *token))
		grpc.SendHeader(ctx, header)
	}

	return new(emptypb.Empty), nil
}
