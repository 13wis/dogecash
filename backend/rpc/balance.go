package rpc

import (
	"context"
	"errors"

	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (s *DogecashServer) Balance(ctx context.Context,
	req *emptypb.Empty) (res *dogecash.BalanceResponse, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}
	if claims.AccountID == nil {
		return nil, GRPCError(ErrorCodeNoIndividual)
	}

	balance, err := tools.GetAvailableBalance(claims.AccountID)
	if err != nil {
		return nil, errors.New(err.Error())
	}

	res = &dogecash.BalanceResponse{Balance: int64(*balance)}
	return
}
