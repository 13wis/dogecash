package rpc

import (
	"context"
	"errors"
	"log"

	"github.com/l3wis/dogecash/db"
	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"gorm.io/gorm"
)

func (s *DogecashServer) Activities(ctx context.Context,
	req *dogecash.ActivityRequest) (res *dogecash.ActivityRepeated, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}

	activities := []*db.Activity{}
	res = &dogecash.ActivityRepeated{Activity: []*dogecash.Activity{}}
	if req.Peer != nil {
		log.Println(claims.DogeID)
		log.Println(*req.Peer)
		err := s.DB.Order("created DESC").
			Where("to_id = ? AND source_id = ?", claims.DogeID, req.Peer).
			Or("to_id = ? AND source_id = ?", req.Peer, claims.DogeID).
			Find(&activities).
			Error
		if err != nil {
			if errors.Is(err, gorm.ErrRecordNotFound) {
				return res, nil
			}

			return nil, GRPCError(ErrorCodeUnknown)
		}
	} else {
		err := s.DB.Order("created DESC").
			Where("source_id = ? OR to_id = ?", claims.DogeID, claims.DogeID).
			Find(&activities).
			Error
		if err != nil {
			if errors.Is(err, gorm.ErrRecordNotFound) {
				return res, nil
			}

			return nil, GRPCError(ErrorCodeUnknown)
		}
	}

	var array []*dogecash.Activity
	for _, activity := range activities {
		activityType, ok := dogecash.Activity_ActivityType_value[activity.ActivityType]
		if !ok {
			log.Println("error parsing enum value")
			return nil, GRPCError(ErrorCodeUnknown)
		}

		var externalAccount *dogecash.ExternalAccount
		if activity.SourceID == claims.DogeID && activity.ExternalAccountType != nil {
			externalAccount = &dogecash.ExternalAccount{
				ExternalAccountType: *activity.ExternalAccountType,
				BankName:            activity.BankName,
				Brand:               activity.Brand,
				Last4:               activity.Last4,
			}
		}

		moneyIn := (activity.ToID != nil &&
			claims.DogeID == *activity.ToID &&
			dogecash.Activity_pay == dogecash.Activity_ActivityType(activityType)) ||
			(dogecash.Activity_add_cash == dogecash.Activity_ActivityType(activityType))
		elems := &dogecash.Activity{
			Id:              activity.ID,
			ActivityType:    dogecash.Activity_ActivityType(activityType),
			Amount:          activity.Amount,
			ArrivalDate:     &activity.ArrivalDate,
			Created:         &activity.Created,
			ExternalAccount: externalAccount,
			Note:            activity.Note,
			Refunded:        activity.Refunded,
			SourceId:        activity.SourceID,
			ToId:            activity.ToID,
			Moneyin:         &moneyIn,
		}

		var peerID *int64
		// If the source of the activity is not the current viewer, qualify the sourceID as the peerID. Otherwise use
		// the toID to qualify the peer.
		if activity.SourceID != claims.DogeID {
			peerID = &activity.SourceID
		} else if activity.ToID != nil {
			peerID = activity.ToID
		}
		if peerID != nil {
			doge := &db.Doge{}
			if err := s.DB.First(&doge, "id = ?", peerID).Error; err != nil {
				if errors.Is(err, gorm.ErrRecordNotFound) {
					return nil, GRPCError(ErrorCodeNoDoge)
				}

				return nil, GRPCError(ErrorCodeUnknown)
			}

			elems.Peer = &dogecash.BaseDoge{
				Id:            doge.ID,
				Dogetag:       doge.Dogetag,
				Email:         doge.Email,
				FirstName:     doge.FirstName,
				LastName:      doge.LastName,
				ProfilePicUrl: doge.ProfilePicUrl,
			}
		}
		if req.ActivityId == nil || (req.ActivityId != nil && *req.ActivityId == activity.ID) {
			array = append(array, elems)
		}
	}

	res.Activity = array
	return
}
