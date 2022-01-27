package rpc

import (
	"context"
	"crypto/rand"
	"io"
	"time"

	"github.com/l3wis/dogecash/db"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"google.golang.org/protobuf/types/known/emptypb"
)

// For testing purposes, we will consistetly use "111111"
func GenerateSixDigit() (*string, error) {
	// Using 17 characters ensures the randomness is evenly distrubted
	// when divided by the length of digits
	min := 6
	digits := []byte{'0', '1', '2', '3', '4',
		'5', '6', '7', '8',
		'9', 'A', 'B', 'C',
		'D', 'E', 'F', 'G'}
	bytes := make([]byte, min)
	if _, err := io.ReadAtLeast(rand.Reader, bytes, min); err != nil {
		return nil, err
	}
	if _, err := rand.Read(bytes); err != nil {
		return nil, err
	}

	for i := 0; i < len(bytes); i++ {
		bytes[i] = digits[int(bytes[i])%len(digits)]
	}

	strBytes := string(bytes)

	return &strBytes, nil
}

func (s *DogecashServer) ForgotPassword(ctx context.Context,
	req *dogecash.ForgotPasswordRequest) (*emptypb.Empty, error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	full := &db.FullDoge{}
	err := s.DB.Table("doges").
		Select("doges.id, h.doge_id").
		Where("email = ?", req.Email).
		Joins("JOIN hidden_doges h on doges.id = h.doge_id").
		First(&full).
		Error
	// We don't want to alert potential sniffers that the email does not exist
	// by sending an error or message.
	if err == nil {
		if verification, err := tools.HashPassword("111111"); err == nil {
			expiration := time.Now().Add(time.Hour).Unix()
			updates := &db.HiddenDoge{
				VerificationHash: &verification,
				HashExpiration:   &expiration,
			}
			s.DB.Table("hidden_doges").
				Where("doge_id = ?", full.HiddenDoge.DogeID).
				Updates(&updates)
		}
	}

	return new(emptypb.Empty), nil
}
