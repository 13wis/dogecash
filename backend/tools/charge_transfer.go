package tools

import (
	"errors"
	"fmt"

	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/charge"
	"github.com/stripe/stripe-go/v72/transfer"
)

type ChargeAndTransferParams struct {
	AccountID   string
	Amount      int64
	CustomerID  string
	Note        *string
	SourceType  stripe.PaymentSourceType
	ToAccountID *string
}

// Initiate both a charge and a transfer. If a recipient account ID is not specified,
// we assume the doge is adding cash.
func ChargeAndTransfer(catp *ChargeAndTransferParams) (*stripe.Charge, error) {
	var (
		currency      = "usd"
		destination   string
		sourceId      string
		transferGroup string
	)

	if catp.ToAccountID == nil {
		transferGroup = fmt.Sprintf(" from %v", catp.SourceType)
		destination = catp.AccountID
	} else {
		transferGroup = fmt.Sprintf("Transfer from %v to %v", catp.AccountID, *catp.ToAccountID)
		destination = *catp.ToAccountID
	}

	switch catp.SourceType {
	case stripe.PaymentSourceTypeAccount:
		sourceId = catp.AccountID
	case stripe.PaymentSourceTypeBankAccount, stripe.PaymentSourceTypeCard:
		source, err := RetrieveSource(catp.CustomerID, catp.SourceType)
		if err != nil {
			return nil, err
		}

		sourceId = source.ID
	}

	params := &stripe.ChargeParams{
		Amount:        &catp.Amount,
		Currency:      &currency,
		Customer:      &catp.CustomerID,
		Description:   catp.Note,
		TransferGroup: &transferGroup,
	}
	params.SetSource(sourceId)
	charge, err := charge.New(params)
	if err != nil {
		return nil, err
	}

	if charge.Status != "succeeded" {
		return nil, errors.New(ChargeNotSucceeded)
	}

	transferParams := &stripe.TransferParams{
		Amount:        &catp.Amount,
		Currency:      &currency,
		Description:   catp.Note,
		Destination:   &destination,
		TransferGroup: &transferGroup,
	}
	transferParams.AddExpand("destination_payment")
	if _, err := transfer.New(transferParams); err != nil {
		return nil, err
	}

	return charge, nil
}
