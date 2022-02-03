package db

import (
	"errors"
	"log"
	"time"

	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/stripe/stripe-go/v72"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
)

type UpdateActivityParams struct {
	ActivityType   dogecash.Activity_ActivityType
	Amount         int64
	DB             *gorm.DB
	DogeID         int64
	Charge         *stripe.Charge
	Payout         *stripe.Payout
	ToID           *int64
	FromActivityID *int64
}

func UpdateActivity(uap *UpdateActivityParams) (*dogecash.Activity, error) {
	if uap == nil {
		return nil, errors.New(MissingCriticalParams)
	}
	activity := &Activity{
		ActivityType: uap.ActivityType.String(),
		SourceID:     uap.DogeID,
	}
	if uap.ActivityType == dogecash.Activity_pay {
		activity.ToID = uap.ToID
	}

	switch uap.ActivityType {
	case dogecash.Activity_add_cash, dogecash.Activity_pay:
		if uap.FromActivityID != nil {
			activity.ID = *uap.FromActivityID
		}
		if uap.Charge == nil {
			return nil, errors.New(MissingPaymentMethodDetails)
		}

		pmd := uap.Charge.PaymentMethodDetails
		if pmd == nil {
			return nil, errors.New(MissingPaymentMethodDetails)
		}

		activity.Amount = uap.Charge.Amount
		activity.Created = uap.Charge.Created
		activity.Note = &uap.Charge.Description
		activity.Refunded = &uap.Charge.Refunded
		activity.ExternalAccountType = (*string)(&pmd.Type)

		switch pmd.Type {
		case stripe.ChargePaymentMethodDetailsTypeCard:
			activity.Brand = (*string)(&pmd.Card.Brand)
			activity.Last4 = &pmd.Card.Last4
		case stripe.ChargePaymentMethodDetailsTypeAchDebit:
			activity.BankName = (*string)(&pmd.AchDebit.BankName)
			activity.Last4 = (*string)(&pmd.AchDebit.Last4)
		}
	case dogecash.Activity_cash_out:
		if uap.Payout == nil {
			return nil, errors.New(MissingPayoutDestinationDetails)
		}

		destination := uap.Payout.Destination
		if destination == nil {
			return nil, errors.New(MissingPayoutDestinationDetails)
		}

		activity.Amount = uap.Payout.Amount
		activity.Created = uap.Payout.Created
		activity.ExternalAccountType = (*string)(&uap.Payout.Type)
		activity.ArrivalDate = uap.Payout.ArrivalDate

		switch uap.Payout.Type {
		case stripe.PayoutTypeBank:
			activity.BankName = (*string)(&destination.BankAccount.BankName)
			activity.Last4 = (*string)(&destination.BankAccount.Last4)
		case stripe.PayoutTypeCard:
			activity.Brand = (*string)(&destination.Card.Brand)
			activity.Last4 = &destination.Card.Last4
		}
	case dogecash.Activity_request:
		if uap.ToID == nil {
			return nil, errors.New(MissingToID)
		}

		activity.Amount = uap.Amount
		activity.Created = time.Now().Unix()
		activity.ToID = uap.ToID
	}

	clauses := clause.OnConflict{UpdateAll: true}
	err := uap.DB.Clauses(clauses).
		Create(&activity).
		Error
	if err != nil {
		log.Println(err)
	}
	dogecashActivity := &dogecash.Activity{
		Id:           activity.ID,
		ActivityType: *uap.ActivityType.Enum(),
		Amount:       activity.Amount,
		ArrivalDate:  &activity.ArrivalDate,
		Created:      &activity.Created,
		Note:         activity.Note,
		Refunded:     activity.Refunded,
		SourceId:     activity.SourceID,
		ToId:         activity.ToID,
	}
	if uap.ActivityType != dogecash.Activity_request {
		dogecashActivity.ExternalAccount = &dogecash.ExternalAccount{
			ExternalAccountType: *activity.ExternalAccountType,
			BankName:            activity.BankName,
			Brand:               activity.Brand,
			Last4:               activity.Last4,
		}
	}

	return dogecashActivity, nil
}
