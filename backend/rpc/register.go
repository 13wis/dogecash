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

func (s *DogecashServer) Register(ctx context.Context,
	req *dogecash.AuthenticationRequest) (res *emptypb.Empty, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	if req.Email == "" || req.Password == "" {
		return nil, GRPCError(ErrorCodeEmptyEmailOrPassword)
	}
	if len(req.Password) < 8 {
		return nil, GRPCError(ErrorCodePasswordLength)
	}

	existing := &db.Doge{}
	if err := s.DB.First(&existing, "email = ?", req.Email).Error; err != nil {
		if !errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, GRPCError(ErrorCodeUnknown)
		}
	}
	if existing.Email == req.Email {
		return nil, GRPCError(ErrorCodeDogeWithEmailAlreadyExists)
	}

	hash, err := tools.HashPassword(req.Password)
	if err != nil {
		return nil, GRPCError(ErrorCodeUnknown)
	}

	doge := &db.Doge{Email: req.Email}
	hidden := &db.HiddenDoge{PasswordHash: hash}
	tx := s.DB.WithContext(ctx)

	tx.Begin()
	tx.SavePoint("precreate")

	if err := tx.Create(&doge).Error; err != nil {
		tx.RollbackTo("precreate")
		return nil, GRPCError(ErrorCodeUnknown)
	}

	hidden.DogeID = doge.ID
	if err := tx.Create(&hidden).Error; err != nil {
		tx.RollbackTo("precreate")
		return nil, GRPCError(ErrorCodeUnknown)
	}

	params := &tools.SignJwtParams{
		DogeID: doge.ID,
	}
	token, err := tools.SignJwt(params)
	if err != nil {
		log.Println(err)
		return nil, GRPCError(ErrorCodeUnknown)
	}

	header := metadata.Pairs("Authorization", fmt.Sprintf("Bearer %s", *token))
	grpc.SendHeader(ctx, header)

	return new(emptypb.Empty), nil
}
