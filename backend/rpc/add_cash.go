package rpc

import (
	"context"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"github.com/stripe/stripe-go/v72"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (s *DogecashServer) AddCash(ctx context.Context,
	req *dogecash.AddCashRequest) (*emptypb.Empty, error) {
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
		ActivityType: dogecash.Activity_add_cash.Enum(),
		DogeID:       claims.DogeID,
		DB:           s.DB,
	}
	if err := RemainingAmountExceeded(&raep); err != nil {
		return nil, err
	}

	catp := &tools.ChargeAndTransferParams{
		AccountID:  *claims.AccountID,
		Amount:     req.Amount,
		CustomerID: *claims.CustomerID,
		SourceType: stripe.PaymentSourceType(req.ExternalAccountType),
	}
	charge, err := tools.ChargeAndTransfer(catp)
	if err != nil {
		return nil, err
	}

	uap := &db.UpdateActivityParams{
		ActivityType: dogecash.Activity_add_cash,
		Amount:       req.Amount,
		Charge:       charge,
		DB:           s.DB,
		DogeID:       claims.DogeID,
	}
	if _, err := db.UpdateActivity(uap); err != nil {
		return new(emptypb.Empty), nil
	}

	return new(emptypb.Empty), nil
}
