package rpc

import (
	"context"
	"errors"

	"github.com/l3wis/dogecash/db"
	dogecash "github.com/l3wis/dogecash/proto"
	"gorm.io/gorm"
)

func (s *DogecashServer) DogetagAvailable(ctx context.Context,
	req *dogecash.DogetagAvailableRequest) (res *dogecash.DogetagAvaiableResponse, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	doge := &db.Doge{}
	res = &dogecash.DogetagAvaiableResponse{Available: false}
	if err := s.DB.First(&doge, "dogetag = ?", req.Dogetag).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			res.Available = true

			return res, nil
		}

		return nil, GRPCError(ErrorCodeUnknown)
	}

	return
}
