package db

import (
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"

	dogecash "github.com/l3wis/dogecash/proto"
	"github.com/l3wis/dogecash/tools"
	"github.com/stripe/stripe-go/v72"
	"gorm.io/gorm"
)

const (
	MissingPaymentMethodDetails     string = "missing payment method details"
	MissingPayoutDestinationDetails string = "missing payout destination details"
	MissingDogeID                   string = "missing Doge ID"
	MissingToID                     string = "missing requesting Doge ID"
	MissingCriticalParams           string = "missing critical params"
)

var (
	day          int64 = 1
	month        int64 = 1
	year         int64 = 1901
	accountIds   []string
	seedNote     string = "initial commit"
	transferNote string = "to my best friend"
)

func getDogecashSchemaSQL() []string {
	cwd, err := os.Getwd()
	if err != nil {
		log.Fatal(err.Error())
	}

	path := filepath.Join(cwd, "db", "schema.sql")
	bytes, err := ioutil.ReadFile(path)
	if err != nil {
		log.Fatal(err.Error())
	}

	schema := string(bytes)

	return strings.SplitAfter(schema, ";")
}

func createTransfer(source stripe.PaymentSourceType,
	dogeId int64,
	recipient int64,
	accountId string,
	customerId string,
	amount int64,
	toAccountId string,
	db *gorm.DB) {
	catParams := &tools.ChargeAndTransferParams{
		AccountID:   accountId,
		CustomerID:  customerId,
		Amount:      amount,
		Note:        &transferNote,
		SourceType:  source,
		ToAccountID: &toAccountId,
	}
	charge, err := tools.ChargeAndTransfer(catParams)
	if err != nil {
		log.Fatal("Charge and transfer error: ", err.Error())
	}

	uap := &UpdateActivityParams{
		ActivityType: dogecash.Activity_pay,
		DB:           db,
		Charge:       charge,
		DogeID:       dogeId,
		ToID:         &recipient,
	}
	if _, err := UpdateActivity(uap); err != nil {
		log.Fatal("Update activity pay error: ", err.Error())
	}

	if err = UpdateMyDoges(dogeId, recipient, dogecash.InteractionType_suggested.String(), db); err != nil {
		log.Fatal("My Doges error: ", err.Error())
	}
}

func SeedDBAndStripe(db *gorm.DB) {
	if err := tools.DeleteStripeData(); err != nil {
		log.Fatal(err.Error())
	}

	for _, split := range getDogecashSchemaSQL() {
		if split != "" {
			if err := db.Exec(split).Error; err != nil {
				log.Fatal("Schema error: ", err.Error())
			}
		}
	}

	baseDoges := []*dogecash.BaseDoge{}
	if err := json.Unmarshal(SeedDoges, &baseDoges); err != nil {
		log.Fatal("JSON unmarshal error: ", err.Error())
	}

	hash, err := tools.HashPassword("dogecash")
	if err != nil {
		log.Fatal("Password hash error: ", err.Error())
	}

	err = tools.SeedStripeAccount()
	if err != nil {
		log.Fatal("Seed stripe error: ", err.Error())
	}

	for i, doge := range baseDoges {
		accountParams := &dogecash.UpdateStripeInfoRequest{
			Day:       &day,
			Month:     &month,
			Year:      &year,
			FirstName: doge.FirstName,
			LastName:  doge.LastName,
			Create:    true,
		}
		accountId, err := tools.UpdateStripeInfo(doge.Email, context.Background(), nil, accountParams)
		if err != nil {
			log.Fatal("Create stripe account error: ", err.Error())
		}

		accountIds = append(accountIds, *accountId)
		customerId, err := tools.CreateCustomer(doge.Email)
		if err != nil {
			log.Fatal("Create customer error: ", err.Error())
		}

		externalAccountParams := &dogecash.UpdateExternalAccountRequest{
			ExternalAccountType: dogecash.UpdateExternalAccountRequest_card,
			Token:               "tok_visa_debit",
		}
		if err := tools.UpdateExternalAccount(*accountId, *customerId, externalAccountParams); err != nil {
			log.Fatal("Create external account error: ", err.Error())
		}

		dobStr := fmt.Sprintf("%d-%d-%d", day, month, year)
		doge := &Doge{
			Dob:                   &dobStr,
			Dogetag:               doge.Dogetag,
			Email:                 doge.Email,
			FirstName:             doge.FirstName,
			LastName:              doge.LastName,
			ExternalAccountLinked: true,
			StripeAccountCreated:  true,
		}
		if err = db.Create(&doge).Error; err != nil {
			log.Fatal("Create doge error: ", err.Error())
		}

		ichParams := &dogecash.NewCardholderRequest{
			Line1: "100 N Tryon Street",
			City:  "Charlotte",
			State: "NC",
			Zip:   "28202",
			Phone: "+1-877-224-4669",
		}
		ichId, cardId, err := tools.CreateCardholder(*accountId, ichParams)
		if err != nil {
			log.Fatal("Create card error: ", err.Error())
		}

		hiddenDoge := &HiddenDoge{
			AccountID:    accountId,
			CustomerID:   customerId,
			DogeID:       doge.ID,
			PasswordHash: hash,
			IchID:        ichId,
			CardID:       cardId,
		}
		if err = db.Create(&hiddenDoge).Error; err != nil {
			log.Fatal("Create hidden doge error: ", err.Error())
		}

		catParams := &tools.ChargeAndTransferParams{
			AccountID:  *accountId,
			CustomerID: *customerId,
			Amount:     10000,
			Note:       &seedNote,
			SourceType: stripe.PaymentSourceTypeCard,
		}
		charge, err := tools.ChargeAndTransfer(catParams)
		if err != nil {
			log.Fatal("Charge and transfer error: ", err.Error())
		}

		uap := &UpdateActivityParams{
			ActivityType: dogecash.Activity_add_cash,
			DB:           db,
			DogeID:       doge.ID,
			Charge:       charge,
		}
		if _, err := UpdateActivity(uap); err != nil {
			log.Fatal("Update activity add cash error: ", err.Error())
		}

		if i > 3 {
			createTransfer(stripe.PaymentSourceTypeAccount, doge.ID, doge.ID-4, *accountId, *customerId, 1994, accountIds[i-3], db)
		} else if i > 2 {
			createTransfer(stripe.PaymentSourceTypeAccount, doge.ID, doge.ID-3, *accountId, *customerId, 1337, accountIds[i-3], db)
		} else if i > 1 {
			createTransfer(stripe.PaymentSourceTypeCard, doge.ID, doge.ID-2, *accountId, *customerId, 6900, accountIds[i-2], db)
		} else if i > 0 {
			createTransfer(stripe.PaymentSourceTypeAccount, doge.ID, doge.ID-1, *accountId, *customerId, 5000, accountIds[i-1], db)
		}

		if i > 1 {
			to := doge.ID - 2
			params := &UpdateActivityParams{
				ActivityType: dogecash.Activity_request,
				Amount:       2500,
				DB:           db,
				DogeID:       doge.ID,
				ToID:         &to,
			}
			if _, err := UpdateActivity(params); err != nil {
				log.Fatal("Update activity request error: ", err.Error())
			}

			if err = UpdateMyDoges(doge.ID, to, dogecash.InteractionType_recent.String(), db); err != nil {
				log.Fatal("My Doges error: ", err.Error())
			}
		}

		cop := &tools.CashOutParams{
			AccountId:   *accountId,
			Amount:      2000,
			Destination: stripe.ExternalAccountTypeCard,
			Instant:     true,
		}
		payout, err := tools.CashOut(cop)
		if err != nil {
			log.Fatal(err.Error())
		}

		uap = &UpdateActivityParams{
			ActivityType: dogecash.Activity_cash_out,
			DB:           db,
			DogeID:       doge.ID,
			Payout:       payout,
		}
		if _, err := UpdateActivity(uap); err != nil {
			log.Fatal("Update activity cash out error: ", err.Error())
		}
	}
}
