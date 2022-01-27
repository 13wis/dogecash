package tools

import (
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/account"
	"github.com/stripe/stripe-go/v72/bankaccount"
	"github.com/stripe/stripe-go/v72/card"
	"github.com/stripe/stripe-go/v72/customer"
)

// Add or replace an external account and attach the source
// to the customer. Only one of each source type will be allowed
// so the source is automatically replaced if one exists.
func UpdateExternalAccount(accountId string, customerId string, uear *dogecash.UpdateExternalAccountRequest) error {
	account, err := account.GetByID(accountId, nil)
	if err != nil {
		return err
	}

	eat := uear.ExternalAccountType.String()
	switch eat {
	case "bank_account":
		params := &stripe.BankAccountParams{
			Account:            &account.ID,
			Token:              &uear.Token,
			DefaultForCurrency: stripe.Bool(true),
		}

		ba, err := bankaccount.New(params)
		if err != nil {
			return err
		}

		if account.ExternalAccounts != nil || len(account.ExternalAccounts.Data) > 0 {
			for _, account := range account.ExternalAccounts.Data {
				if string(account.Type) == eat && account.Card.ID != ba.ID {
					params := &stripe.BankAccountParams{Account: &accountId}
					if _, err := bankaccount.Del(account.Card.ID, params); err != nil {
						return err
					}
				}
			}
		}
	case "card":
		params := &stripe.CardParams{
			Account:            &account.ID,
			Token:              &uear.Token,
			DefaultForCurrency: stripe.Bool(true),
		}

		c, err := card.New(params)
		if err != nil {
			return err
		}

		if account.ExternalAccounts != nil || len(account.ExternalAccounts.Data) > 0 {
			for _, account := range account.ExternalAccounts.Data {
				if string(account.Type) == eat && account.Card.ID != c.ID {
					params := &stripe.CardParams{Account: &accountId}
					if _, err := card.Del(account.Card.ID, params); err != nil {
						return err
					}
				}
			}
		}
	}

	params := &stripe.CustomerParams{
		Source: &stripe.SourceParams{
			Token: &uear.Token,
		},
	}
	if _, err := customer.Update(customerId, params); err != nil {
		return err
	}

	return nil
}
