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

func (s *DogecashServer) NewCardholder(ctx context.Context,
	req *dogecash.NewCardholderRequest) (res *emptypb.Empty, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}

	ichId, cardId, err := tools.CreateCardholder(*claims.AccountID, req)
	if err != nil {
		return nil, err
	}

	full := &db.FullDoge{}
	err = s.DB.Table("doges").
		Select("doges.*, h.*").
		Where("id = ?", claims.Id).
		Joins("JOIN hidden_doges h on doges.id = h.doge_id").
		First(&full).
		Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeInvalidCombination)
		}

		return nil, GRPCError(ErrorCodeUnknown)
	}

	updates := &db.HiddenDoge{IchID: ichId}
	err = s.DB.Model(&db.HiddenDoge{}).
		Where("doge_id = ?", full.HiddenDoge.DogeID).
		Updates(&updates).
		Error
	if err != nil {
		return nil, GRPCError(ErrorCodeUnknown)
	}

	params := &tools.SignJwtParams{
		AccountID:  full.HiddenDoge.AccountID,
		CustomerID: full.HiddenDoge.CustomerID,
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

	return new(emptypb.Empty), nil
}
