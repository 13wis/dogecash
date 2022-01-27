package tools

import (
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/account"
	"github.com/stripe/stripe-go/v72/card"
	"github.com/stripe/stripe-go/v72/charge"
	"github.com/stripe/stripe-go/v72/customer"
	"github.com/stripe/stripe-go/v72/issuing/cardholder"
	"github.com/stripe/stripe-go/v72/refund"
	"github.com/stripe/stripe-go/v72/reversal"
	"github.com/stripe/stripe-go/v72/transfer"
)

// Delete all associated stripe data for the owning account
func DeleteStripeData() error {
	list := transfer.List(&stripe.TransferListParams{})

	for list.Next() {
		t := list.Transfer()
		if !t.Reversed {
			params := &stripe.ReversalParams{Transfer: &t.ID}
			if _, err := reversal.New(params); err != nil {
				return err
			}
		}
	}

	chargeList := charge.List(&stripe.ChargeListParams{})

	for chargeList.Next() {
		c := chargeList.Charge()
		if !c.Refunded && c.Paid && c.Description != InitialSeedDescription {
			params := &stripe.RefundParams{Charge: &c.ID}
			if _, err := refund.New(params); err != nil {
				return err
			}
		}
	}

	accountList := account.List(&stripe.AccountListParams{})

	for accountList.Next() {
		a := accountList.Account()
		if a.Type == stripe.AccountTypeCustom {
			if _, err := account.Del(a.ID, &stripe.AccountParams{}); err != nil {
				return err
			}
		}
	}

	customerList := customer.List(&stripe.CustomerListParams{})

	for customerList.Next() {
		c := customerList.Customer()
		if _, err := customer.Del(c.ID, &stripe.CustomerParams{}); err != nil {
			return err
		}
	}

	cardholderList := cardholder.List(&stripe.IssuingCardholderListParams{})

	for cardholderList.Next() {
		ic := cardholderList.IssuingCardholder()
		params := &stripe.IssuingCardholderParams{Status: stripe.String("inactive")}
		if _, err := cardholder.Update(ic.ID, params); err != nil {
			return err
		}
	}

	cardList := card.List(&stripe.CardListParams{})

	for cardList.Next() {
		ca := cardList.Card()
		if _, err := card.Del(ca.ID, &stripe.CardParams{}); err != nil {
			return err
		}
	}

	return nil
}
