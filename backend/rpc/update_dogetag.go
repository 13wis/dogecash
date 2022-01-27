package rpc

import (
	"context"
	"errors"
	"fmt"
	"log"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
)

func (s *DogecashServer) UpdateDogetag(ctx context.Context,
	req *dogecash.UpdateDogetagRequest) (*emptypb.Empty, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}
	if len(req.Dogetag) < 4 {
		return nil, GRPCError(ErrorCodeInvalidDogetagLength)
	}

	doge := &db.Doge{}
	if err := s.DB.First(&doge, "dogetag = ?", req.Dogetag).Error; err != nil {
		if !errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeUnknown)
		}
	}
	if doge.Dogetag != nil {
		return nil, GRPCError(ErrorCodeDogetagAlreadyExists)
	}

	full := &db.FullDoge{}
	err := s.DB.Table("doges").
		Select("doges.*, h.*").
		Where("id = ?", claims.DogeID).
		Joins("JOIN hidden_doges h on doges.id = h.doge_id").
		First(&full).
		Error
	if err != nil {
		log.Println(err.Error())
		return new(emptypb.Empty), nil
	}

	updates := &db.Doge{Dogetag: &req.Dogetag}
	err = s.DB.Model(&db.Doge{}).
		Where("id = ?", full.Doge.ID).
		Updates(&updates).
		Error
	if err != nil {
		return nil, GRPCError(ErrorCodeUnknown)
	}

	params := &tools.SignJwtParams{
		AccountID:  full.HiddenDoge.AccountID,
		CustomerID: full.HiddenDoge.CustomerID,
		DogeID:     claims.DogeID,
		Dogetag:    &req.Dogetag,
		IchID:      full.HiddenDoge.IchID,
		CardID:     full.HiddenDoge.CardID,
	}
	token, err := tools.SignJwt(params)
	if err != nil || token == nil {
		log.Println(err.Error())
		return new(emptypb.Empty), nil
	}

	header := metadata.Pairs("Authorization", fmt.Sprintf("Bearer %s", *token))
	grpc.SendHeader(ctx, header)

	return new(emptypb.Empty), nil
}
