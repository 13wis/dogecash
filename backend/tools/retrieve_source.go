package tools

import (
	"errors"

	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/customer"
)

func RetrieveSource(customerId string, source stripe.PaymentSourceType) (*stripe.PaymentSource, error) {
	params := &stripe.CustomerParams{}
	params.AddExpand("sources")
	customer, err := customer.Get(customerId, params)
	if err != nil {
		return nil, err
	}
	if customer.Sources == nil || customer.Sources.Data == nil || len(customer.Sources.Data) == 0 {
		return nil, errors.New(NoSources)
	}

	for _, s := range customer.Sources.Data {
		if s.Type == source {
			return s, nil
		}
	}

	return nil, errors.New(NoMatchingSource)
}
