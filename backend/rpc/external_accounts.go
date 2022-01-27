package rpc

import (
	"context"
	"strings"

	"github.com/l3wis/dogecash/interceptors"
	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"github.com/stripe/stripe-go/v72"
	"google.golang.org/protobuf/types/known/emptypb"
)

func (s *DogecashServer) ExternalAccounts(ctx context.Context,
	req *emptypb.Empty) (res *dogecash.ExternalAccountsResponse, err error) {
	s.mu.Lock()
	defer s.mu.Unlock()

	claims, ok := ctx.Value(interceptors.Key).(*tools.Claims)
	if !ok {
		return nil, GRPCError(ErrorCodeInvalidToken)
	}
	if claims.AccountID == nil {
		return nil, GRPCError(ErrorCodeNoIndividual)
	}

	account, err := tools.GetAccount(*claims.AccountID)
	if err != nil {
		return nil, err
	}

	data := account.ExternalAccounts.Data
	res = &dogecash.ExternalAccountsResponse{ExternalAccount: []*dogecash.ExternalAccount{}}
	if len(data) == 0 {
		return res, nil
	}

	var externalAccounts []*dogecash.ExternalAccount
	for _, ea := range data {
		externalAccount := &dogecash.ExternalAccount{
			ExternalAccountType: string(ea.Type),
		}
		instant := false

		switch ea.Type {
		case stripe.ExternalAccountTypeBankAccount:
			externalAccount.BankName = &ea.BankAccount.BankName
			externalAccount.Last4 = &ea.BankAccount.Last4

			for _, methods := range ea.BankAccount.AvailablePayoutMethods {
				if methods == stripe.BankAccountAvailablePayoutMethodInstant {
					instant = true
				}
			}
		case stripe.ExternalAccountTypeCard:
			externalAccount.Brand = (*string)(&ea.Card.Brand)
			externalAccount.Last4 = &ea.Card.Last4
			externalAccount.ExpMonth = stripe.Int64(int64(ea.Card.ExpMonth))
			externalAccount.ExpYear = stripe.Int64(int64(ea.Card.ExpYear))

			for _, methods := range ea.Card.AvailablePayoutMethods {
				if strings.EqualFold(string(methods), string(stripe.CardAvailablePayoutMethodInstant)) {
					instant = true
				}
			}
		}
		externalAccount.Eligible = &instant
		externalAccounts = append(externalAccounts, externalAccount)
	}

	res.ExternalAccount = externalAccounts
	return
}
