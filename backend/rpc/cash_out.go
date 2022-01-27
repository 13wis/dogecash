package rpc

import (
	"context"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"github.com/stripe/stripe-go/v72"
)

func (s *DogecashServer) CashOut(ctx context.Context,
	req *dogecash.CashOutRequest) (res *dogecash.Activity, err error) {
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

	raep := RemainingAmountExceededParams{
		Amount:       req.Amount,
		ActivityType: dogecash.Activity_cash_out.Enum(),
		DogeID:       claims.DogeID,
		DB:           s.DB,
	}
	if err := RemainingAmountExceeded(&raep); err != nil {
		return nil, err
	}

	cop := &tools.CashOutParams{
		AccountId:   *claims.AccountID,
		Amount:      req.Amount,
		Destination: stripe.ExternalAccountType(req.ExternalAccountType),
		Instant:     req.Instant,
	}
	payout, err := tools.CashOut(cop)
	if err != nil {
		return nil, err
	}

	uap := &db.UpdateActivityParams{
		ActivityType: dogecash.Activity_cash_out,
		Amount:       payout.Amount,
		DB:           s.DB,
		DogeID:       claims.DogeID,
		Payout:       payout,
	}
	res, err = db.UpdateActivity(uap)
	return
}
