package rpc

import (
	"errors"
	"fmt"

	"github.com/l3wis/dogecash/db"
	dogecash "github.com/l3wis/dogecash/proto"
	"gorm.io/gorm"
)

func (s *DogecashServer) SearchDoges(stream dogecash.Dogecash_SearchDogesServer) error {
	for {
		res := &dogecash.SearchDogesResponse{Doge: []*dogecash.BaseDoge{}}
		req, err := stream.Recv()
		if err != nil {
			return err
		}
		if req != nil {
			limit := 10
			if req.Limit != nil {
				limit = int(*req.Limit)
			}

			doges := []*db.Doge{}
			like := fmt.Sprintf("%%%s%%", req.Query)
			err = s.DB.Table("doges").
				Where("dogetag LIKE ?", like).
				Or("email LIKE ?", like).
				Or("first_name LIKE ?", like).
				Or("last_name LIKE ?", like).
				Limit(limit).
				Find(&doges).
				Error
			if err != nil {
				if errors.Is(err, gorm.ErrRecordNotFound) {
					return stream.SendMsg(res)
				}
			}

			var baseDoges []*dogecash.BaseDoge
			for _, doge := range doges {
				formattedDoge := &dogecash.BaseDoge{
					Id:            doge.ID,
					Dogetag:       doge.Dogetag,
					Email:         doge.Email,
					FirstName:     doge.FirstName,
					LastName:      doge.LastName,
					ProfilePicUrl: doge.ProfilePicUrl,
				}
				baseDoges = append(baseDoges, formattedDoge)
			}

			res.Doge = baseDoges
			stream.SendMsg(res)
		}
	}
}
