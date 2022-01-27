package tools

import (
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/paymentintent"
)

// Fund the base account with $25,000.00 if the balance is
// less than that number. The transaction always succeeds
func SeedStripeAccount() error {
	balance, err := GetAvailableBalance(nil)
	if err != nil {
		return err
	}

	if balance != nil && *balance < 2500000 {
		initial := InitialSeedDescription
		params := &stripe.PaymentIntentParams{
			Amount:        stripe.Int64(2500000),
			Currency:      stripe.String(string(stripe.CurrencyUSD)),
			Description:   &initial,
			PaymentMethod: stripe.String("pm_card_bypassPending"),
			Confirm:       stripe.Bool(true),
		}
		if _, err := paymentintent.New(params); err != nil {
			return err
		}
	}

	return nil
}
