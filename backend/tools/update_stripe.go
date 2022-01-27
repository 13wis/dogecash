package tools

import (
	"context"
	"errors"
	"time"

	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/stripe/stripe-go/v72"
	"github.com/stripe/stripe-go/v72/account"
	"google.golang.org/grpc/peer"
)

// Create or update a custom connected account using the customer's
// information. Returns the newly created account ID or an error
func UpdateStripeInfo(email string, ctx context.Context, accountId *string, usir *dogecash.UpdateStripeInfoRequest) (*string, error) {
	params := &stripe.AccountParams{}
	params.Individual = &stripe.PersonParams{}
	params.Individual.DOB = &stripe.DOBParams{}

	params.Individual.FirstName = usir.FirstName
	params.Individual.LastName = usir.LastName

	if !usir.Create {
		if accountId == nil {
			return nil, errors.New("account ID missing")
		}

		account, err := account.Update(*accountId, params)
		if err != nil {
			return nil, err
		}

		return &account.ID, nil
	}

	if usir.Day == nil || usir.Month == nil || usir.Year == nil {
		return nil, errors.New("missing required stripe account parameters")
	}

	params.Individual.DOB.Day = usir.Day
	params.Individual.DOB.Month = usir.Month
	params.Individual.DOB.Year = usir.Year
	params.Individual.SSNLast4 = stripe.String("1111")
	params.Email = &email
	params.BusinessProfile = &stripe.AccountBusinessProfileParams{
		ProductDescription: stripe.String("P2P Payments"),
	}
	params.BusinessType = stripe.String("individual")
	params.Capabilities = &stripe.AccountCapabilitiesParams{
		Transfers: &stripe.AccountCapabilitiesTransfersParams{
			Requested: stripe.Bool(true),
		},
	}
	params.Country = stripe.String("US")
	params.Settings = &stripe.AccountSettingsParams{
		Payouts: &stripe.AccountSettingsPayoutsParams{
			Schedule: &stripe.PayoutScheduleParams{
				Interval: stripe.String("manual"),
			},
		},
	}

	var ip string
	p, ok := peer.FromContext(ctx)
	if ok {
		ip = p.Addr.String()
	} else {
		ip = "13.112.224.240"
	}

	params.TOSAcceptance = &stripe.AccountTOSAcceptanceParams{
		Date: stripe.Int64(time.Now().UTC().UnixNano() / 1e9),
		IP:   &ip,
	}
	params.Type = stripe.String("custom")

	account, err := account.New(params)
	if err != nil {
		return nil, err
	}

	return &account.ID, nil
}
