package tools

import (
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/account"
)

func GetAccount(accountId string) (*stripe.Account, error) {
	account, err := account.GetByID(accountId, &stripe.AccountParams{})
	if err != nil {
		return nil, err
	}

	return account, nil
}
