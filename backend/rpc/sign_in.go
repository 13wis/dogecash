package rpc

import (
	"context"
	"errors"
	"fmt"
	"log"

	"github.com/l3wis/dogecash/db"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
)

func (s *DogecashServer) SignIn(ctx context.Context,
	req *dogecash.AuthenticationRequest) (res *emptypb.Empty, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	full := &db.FullDoge{}
	err = s.DB.Table("doges").
		Select("doges.*, h.*").
		Where("email = ?", req.Email).
		Joins("JOIN hidden_doges h on doges.id = h.doge_id").
		First(&full).
		Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeInvalidCombination)
		}

		return nil, GRPCError(ErrorCodeUnknown)
	}

	valid := tools.CheckPasswordHash(req.Password, full.HiddenDoge.PasswordHash)
	if !valid {
		return nil, GRPCError(ErrorCodeInvalidCombination)
	}

	params := &tools.SignJwtParams{
		AccountID:  full.HiddenDoge.AccountID,
		CustomerID: full.HiddenDoge.CustomerID,
		Dogetag:    full.Doge.Dogetag,
		DogeID:     full.Doge.ID,
		IchID:      full.HiddenDoge.IchID,
		CardID:     full.HiddenDoge.CardID,
	}
	token, err := tools.SignJwt(params)
	if err != nil || token == nil {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}

	log.Println(*token)

	header := metadata.Pairs("Authorization", fmt.Sprintf("Bearer %s", *token))
	grpc.SendHeader(ctx, header)

	return new(emptypb.Empty), nil
}
