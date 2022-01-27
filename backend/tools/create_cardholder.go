package tools

import (
	"errors"
	"fmt"

	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/issuing/card"
	"github.com/stripe/stripe-go/v72/issuing/cardholder"
)

func CreateCardholder(accountId string, ncr *dogecash.NewCardholderRequest) (*string, *string, error) {
	account, err := GetAccount(accountId)
	if err != nil {
		return nil, nil, err
	}
	if account.Individual == nil {
		return nil, nil, errors.New("name information missing")
	}

	ich := &stripe.IssuingCardholderParams{
		Billing: &stripe.IssuingCardholderBillingParams{
			Address: &stripe.AddressParams{
				Country:    stripe.String("US"),
				Line1:      &ncr.Line1,
				City:       &ncr.City,
				PostalCode: &ncr.Zip,
				State:      &ncr.State,
			},
		},
		Email:       &account.Email,
		Name:        stripe.String(fmt.Sprintf("%s %s", account.Individual.FirstName, account.Individual.LastName)),
		PhoneNumber: &ncr.Phone,
		Status:      stripe.String(string(stripe.IssuingCardholderStatusActive)),
		Type:        stripe.String(string(stripe.IssuingCardholderTypeIndividual)),
	}

	ch, err := cardholder.New(ich)
	if err != nil {
		return nil, nil, err
	}

	ic := &stripe.IssuingCardParams{
		Cardholder: &ch.ID,
		Currency:   stripe.String(string(stripe.CurrencyUSD)),
		Type:       stripe.String("virtual"),
		Status:     stripe.String(string(stripe.IssuingCardStatusActive)),
		SpendingControls: &stripe.IssuingCardSpendingControlsParams{
			SpendingLimits: []*stripe.IssuingCardSpendingControlsSpendingLimitParams{
				{
					Amount:   stripe.Int64(999999),
					Interval: stripe.String(string(stripe.IssuingCardSpendingControlsSpendingLimitIntervalDaily)),
				},
			},
		},
	}
	card, err := card.New(ic)
	if err != nil {
		return nil, nil, err
	}

	return &ch.ID, &card.ID, nil
}
