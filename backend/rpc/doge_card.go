package rpc

import (
	"context"

	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
)

func (s *DogecashServer) DogeCard(ctx context.Context,
	req *dogecash.DogeCardRequest) (res *dogecash.DogeCardResponse, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}
	if claims.CardID == nil {
		return nil, GRPCError(ErrorCodeNoIndividual)
	}

	res, err = tools.GetCardInfo(*claims.CardID, req.Full)
	return
}
