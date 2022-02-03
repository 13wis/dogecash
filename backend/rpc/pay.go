package rpc

import (
	"context"
	"errors"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"github.com/stripe/stripe-go/v72"
	"gorm.io/gorm"
)

func (s *DogecashServer) Pay(ctx context.Context,
	req *dogecash.PayRequest) (res *dogecash.Activity, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}
	if claims.AccountID == nil || claims.CustomerID == nil {
		return nil, GRPCError(ErrorCodeNoIndividual)
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

	params := &tools.ChargeAndTransferParams{
		AccountID:  *claims.AccountID,
		Amount:     req.Amount,
		CustomerID: *claims.CustomerID,
		Note:       req.Note,
		SourceType: stripe.PaymentSourceType(req.SourceType.String()),
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
	params.ToAccountID = full.HiddenDoge.AccountID

	charge, err := tools.ChargeAndTransfer(params)
	if err != nil {
		return nil, err
	}

	uap := &db.UpdateActivityParams{
		ActivityType: dogecash.Activity_pay,
		Amount:       charge.Amount,
		DB:           s.DB,
		DogeID:       claims.DogeID,
		Charge:       charge,
		ToID:         &req.To,
	}
	res, err = db.UpdateActivity(uap)
	res.Peer = &dogecash.BaseDoge{
		Id:            full.Doge.ID,
		Dogetag:       full.Doge.Dogetag,
		Email:         full.Doge.Email,
		FirstName:     full.Doge.FirstName,
		LastName:      full.Doge.LastName,
		ProfilePicUrl: full.Doge.ProfilePicUrl,
	}
	_ = db.UpdateMyDoges(claims.DogeID, req.To, dogecash.InteractionType_suggested.String(), s.DB)
	return
}
