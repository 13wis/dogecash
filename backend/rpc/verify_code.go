package rpc

import (
	"context"

	"github.com/l3wis/dogecash/db"
	dogecash "github.com/l3wis/dogecash/proto"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (s *DogecashServer) VerifyCode(ctx context.Context,
	req *dogecash.VerifyCodeRequest) (*emptypb.Empty, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	full := &db.FullDoge{}
	err := s.DB.Table("doges").
		Select("doges.id, h.doge_id, h.verification_hash, h.hash_expiration").
		Where("email = ?", req.Email).
		Joins("JOIN hidden_doges h on doges.id = h.doge_id").
		First(&full).
		Error
	if err != nil {
		return nil, GRPCError(ErrorCodeUnknown)
	}
	if valid := Verify(&full.HiddenDoge, req.Code); valid {
		return new(emptypb.Empty), nil
	}

	return nil, GRPCError(ErrorCodeFailedToVerify)
}
