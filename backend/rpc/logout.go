package rpc

import (
	"context"

	"google.golang.org/protobuf/types/known/emptypb"
)

func (s *DogecashServer) Logout(ctx context.Context,
	req *emptypb.Empty) (res *emptypb.Empty, err error) {
	return new(emptypb.Empty), nil
}
