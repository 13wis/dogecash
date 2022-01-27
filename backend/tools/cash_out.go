package tools

import (
	"errors"

	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/account"
	"github.com/stripe/stripe-go/v72/payout"
)

type CashOutParams struct {
	AccountId   string
	Amount      int64
	Destination stripe.ExternalAccountType
	Instant     bool
}

func CashOut(cop *CashOutParams) (*stripe.Payout, error) {
	var method string
	account, err := account.GetByID(cop.AccountId, nil)
	if err != nil {
		return nil, err
	}
	if account.ExternalAccounts == nil || len(account.ExternalAccounts.Data) == 0 {
		return nil, errors.New(NoExternalAccounts)
	}

	for _, a := range account.ExternalAccounts.Data {
		if a.Type == cop.Destination {
			if cop.Instant {
				method = "instant"
			} else {
				method = "standard"
			}

			params := &stripe.PayoutParams{
				Amount:      &cop.Amount,
				Currency:    stripe.String(Currency),
				Method:      &method,
				Destination: &a.ID,
			}
			params.SetStripeAccount(cop.AccountId)
			params.AddExpand("destination")
			payout, err := payout.New(params)
			if err != nil {
				return nil, err
			}

			return payout, nil
		}
	}

	return nil, errors.New(InvalidSourceType)
}
