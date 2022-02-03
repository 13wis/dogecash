package rpc

import (
	"context"
	"errors"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"gorm.io/gorm"
)

func (s *DogecashServer) SendRequest(ctx context.Context,
	req *dogecash.SendRequestRequest) (res *dogecash.Activity, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}
	if req.Amount < tools.MinimumAmount {
		return nil, GRPCError(ErrorCodeAmountTooLow)
	}
	if req.Amount > tools.MaximumAmount {
		return nil, GRPCError(ErrorCodeAmountTooHigh)
	}
	if req.To == claims.DogeID {
		return nil, GRPCError(ErrorCodeSelfTransfer)
	}

	full := &db.FullDoge{}
	err = s.DB.Table("doges").
		Select("doges.*, h.account_id").
		Where("id = ?", req.To).
		Joins("JOIN hidden_doges h on doges.id = h.doge_id").
		First(&full).
		Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeNoRecipientDoge)
		}

		return nil, GRPCError(ErrorCodeUnknown)
	}
	if full.HiddenDoge.AccountID == nil {
		return nil, GRPCError(ErrorCodeRecipientNotOnboard)
	}

	params := &db.UpdateActivityParams{
		ActivityType: dogecash.Activity_request,
		Amount:       req.Amount,
		DB:           s.DB,
		DogeID:       claims.DogeID,
		ToID:         &req.To,
	}
	res, err = db.UpdateActivity(params)
	res.Peer = &dogecash.BaseDoge{
		Id:            full.Doge.ID,
		Dogetag:       full.Doge.Dogetag,
		Email:         full.Doge.Email,
		FirstName:     full.Doge.FirstName,
		LastName:      full.Doge.LastName,
		ProfilePicUrl: full.Doge.ProfilePicUrl,
	}
	_ = db.UpdateMyDoges(claims.DogeID, req.To, dogecash.InteractionType_recent.String(), s.DB)
	return
}
