package tools

import (
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/issuing/card"
)

func GetCardInfo(ich string, full *bool) (*dogecash.DogeCardResponse, error) {
	params := &stripe.IssuingCardParams{}
	if full != nil && *full {
		params.AddExpand("number")
		params.AddExpand("cvc")
	}
	card, err := card.Get(ich, params)
	if err != nil {
		return nil, err
	}

	res := &dogecash.DogeCardResponse{
		Brand:    &card.Brand,
		ExpMonth: &card.ExpMonth,
		ExpYear:  &card.ExpYear,
		Last4:    &card.Last4,
		Number:   &card.Number,
		Cvc:      &card.CVC,
	}
	return res, nil
}
