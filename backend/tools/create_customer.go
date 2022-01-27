package tools

import (
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/customer"
)

// Create a customer using their email. Since stripe allows
// multiple customers with the same email, we first check for
// the email's existence before creating a new one for
// simplicity purposes
func CreateCustomer(email string) (*string, error) {
	list := customer.List(&stripe.CustomerListParams{})

	for list.Next() {
		customer := list.Customer()
		if customer.Email == email {
			return &customer.ID, nil
		}
	}

	params := &stripe.CustomerParams{
		Email: &email,
	}

	customer, err := customer.New(params)
	if err != nil {
		return nil, err
	}

	return &customer.ID, nil
}
