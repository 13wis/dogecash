package db

import (
	"time"
)

type Activity struct {
	ID                  int64 `gorm:"primaryKey;autoIncrement;"`
	ActivityType        string
	Amount              int64
	ArrivalDate         int64
	BankName            *string
	Brand               *string
	Created             int64
	ExternalAccountType *string
	Last4               *string
	Note                *string
	Refunded            *bool `gorm:"default:false;"`
	SourceID            int64
	ToID                *int64
}

type Doge struct {
	ID                    int64     `gorm:"primaryKey;autoIncrement;"`
	CreatedAt             time.Time `gorm:"default:current_timestamp;"`
	Dob                   *string
	Dogetag               *string
	Email                 string
	FirstName             *string
	LastName              *string
	ExternalAccountLinked bool `gorm:"default:false;"`
	StripeAccountCreated  bool `gorm:"default:false;"`
	ProfilePicUrl         *string
	UpdatedAt             time.Time `gorm:"default:current_timestamp ON update current_timestamp;"`
}

type HiddenDoge struct {
	AccountID        *string
	CustomerID       *string
	DogeID           int64
	PasswordHash     string
	VerificationHash *string
	HashExpiration   *int64
	IchID            *string
	CardID           *string
}

type MyDoges struct {
	Dogee           int64
	Doger           int64
	InteractionType string    `gorm:"default:'recent';"`
	LastInteraction time.Time `gorm:"default:current_timestamp ON update current_timestamp;"`
}

type FullDoge struct {
	Doge       Doge       `gorm:"embedded"`
	HiddenDoge HiddenDoge `gorm:"embedded;foreignkey:DogeID;"`
}
