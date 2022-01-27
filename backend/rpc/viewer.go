package rpc

import (
	"context"
	"errors"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/timestamppb"
	"gorm.io/gorm"
)

func (s *DogecashServer) Viewer(ctx context.Context,
	req *emptypb.Empty) (res *dogecash.ViewerResponse, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}

	existing := &db.Doge{}
	if err := s.DB.First(&existing, "id = ?", claims.DogeID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeNoDoge)
		}
	}

	res = &dogecash.ViewerResponse{
		Doge: &dogecash.BaseDoge{
			Id:            existing.ID,
			Dogetag:       existing.Dogetag,
			Email:         existing.Email,
			FirstName:     existing.FirstName,
			LastName:      existing.LastName,
			ProfilePicUrl: existing.ProfilePicUrl,
		},
		CreatedAt:             timestamppb.New(existing.CreatedAt),
		ExternalAccountLinked: existing.ExternalAccountLinked,
		StripeAccountCreated:  existing.StripeAccountCreated,
	}
	return
}
