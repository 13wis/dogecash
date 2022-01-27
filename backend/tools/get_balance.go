package tools

import (
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/balance"
)

// Get a doge's available balance
func GetAvailableBalance(accountId *string) (*int, error) {
	params := &stripe.BalanceParams{}
	if accountId != nil {
		params.SetStripeAccount(*accountId)
	}

	balances, err := balance.Get(params)
	if err != nil {
		return nil, err
	}

	var availableBalance int
	for _, balance := range balances.Available {
		availableBalance += int(balance.Value)
	}

	return &availableBalance, nil
}
