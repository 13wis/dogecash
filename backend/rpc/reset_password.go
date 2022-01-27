package rpc

import (
	"context"

	"github.com/l3wis/dogecash/db"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (s *DogecashServer) ResetPassword(ctx context.Context,
	req *dogecash.ResetPasswordRequest) (*emptypb.Empty, error) {
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
		if len(req.Password) < 8 {
			return nil, GRPCError(ErrorCodePasswordLength)
		}
		password, err := tools.HashPassword(req.Password)
		if err != nil {
			return nil, GRPCError(ErrorCodeUnknown)
		}

		updates := &db.HiddenDoge{
			VerificationHash: nil,
			HashExpiration:   nil,
			PasswordHash:     password,
		}
		err = s.DB.Model(&db.HiddenDoge{}).
			Where("doge_id = ?", full.HiddenDoge.DogeID).
			Updates(&updates).
			Error
		if err != nil {
			return nil, GRPCError(ErrorCodeUnknown)
		}

		return new(emptypb.Empty), nil
	}

	return nil, GRPCError(ErrorCodeFailedToVerify)
}
