package rpc

import (
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type ErrorCode uint32

const (
	ErrorCodeAmountTooHigh              ErrorCode = 0x10
	ErrorCodeAmountTooLow               ErrorCode = 0x11
	ErrorCodeEmptyEmailOrPassword       ErrorCode = 0x12
	ErrorCodeDogeWithEmailAlreadyExists ErrorCode = 0x13
	ErrorCodeDogetagAlreadyExists       ErrorCode = 0x14
	ErrorCodeInvalidCombination         ErrorCode = 0x15
	ErrorCodeInvalidSource              ErrorCode = 0x16
	ErrorCodeInvalidToken               ErrorCode = 0x17
	ErrorCodeNoDoge                     ErrorCode = 0x18
	ErrorCodeNoDogetag                  ErrorCode = 0x19
	ErrorCodeNoExpand                   ErrorCode = 0x1A
	ErrorCodeNoIndividual               ErrorCode = 0x1C
	ErrorCodeNoSource                   ErrorCode = 0x1D
	ErrorCodeNotLoggedin                ErrorCode = 0x1E
	ErrorCodePasswordLength             ErrorCode = 0x1F
	ErrorCodePaymentSource              ErrorCode = 0x20
	ErrorCodeNoRecipientDoge            ErrorCode = 0x21
	ErrorCodeRecipientNotOnboard        ErrorCode = 0x22
	ErrorCodeSelfTransfer               ErrorCode = 0x23
	ErrorCodeSettingToken               ErrorCode = 0x24
	ErrorCodeStripe                     ErrorCode = 0x25
	ErrorCodeUnknown                    ErrorCode = 0x26
	ErrorCodeYouHaveNoMoney             ErrorCode = 0x27
	ErrorCodeInvalidDogetagLength       ErrorCode = 0x28
	ErrorCodeFailedToVerify             ErrorCode = 0x29
	ErrorCodeMaxAddCashOrPayout         ErrorCode = 0x2A
	ErrorCodeSpecialCharacters          ErrorCode = 0x2B
)

var errorMessage = map[ErrorCode]string{
	ErrorCodeAmountTooHigh:              "amount entered too high, must be under $9,999.99 or $5,000.00 for payouts",
	ErrorCodeAmountTooLow:               "amount entered too low, must be over $0.50",
	ErrorCodeDogeWithEmailAlreadyExists: "doge with email already exists",
	ErrorCodeDogetagAlreadyExists:       "dogetag already exists",
	ErrorCodeEmptyEmailOrPassword:       "email and/or password empty",
	ErrorCodeInvalidCombination:         "invalid combination of email and password",
	ErrorCodeInvalidDogetagLength:       "dogetag must be longer than 4 characters",
	ErrorCodeInvalidSource:              "invalid source type",
	ErrorCodeInvalidToken:               "invalid token or missing token parameters, try logging in again",
	ErrorCodeNoDoge:                     "no doge or account found with credentials",
	ErrorCodeNoDogetag:                  "no dogetag found for doge, are you logged in?",
	ErrorCodeNoExpand:                   "missing payment details from initial request",
	ErrorCodeNoIndividual:               "missing critical account information from token, did you finish onboarding?",
	ErrorCodeNoRecipientDoge:            "no recipient doge found",
	ErrorCodeNotLoggedin:                "not logged in or invalid token",
	ErrorCodeNoSource:                   "no bank account or card added",
	ErrorCodePasswordLength:             "password not long enough",
	ErrorCodeRecipientNotOnboard:        "recipient not yet onboarded",
	ErrorCodePaymentSource:              "payment source issue, refer to account page for details",
	ErrorCodeSelfTransfer:               "cannot transfer from account balance to self",
	ErrorCodeSettingToken:               "error setting doge token",
	ErrorCodeStripe:                     "stripe error encountered",
	ErrorCodeUnknown:                    "unknow server error",
	ErrorCodeYouHaveNoMoney:             "payment source declined, are you broke?",
	ErrorCodeFailedToVerify:             "failed to verify reset code",
	ErrorCodeMaxAddCashOrPayout:         "you have reached the weekly maximum of $9,999.99",
	ErrorCodeSpecialCharacters:          "dogetag contains restricted characters",
}

var mapErrorCode = map[ErrorCode]codes.Code{
	ErrorCodeAmountTooHigh:              codes.InvalidArgument,
	ErrorCodeAmountTooLow:               codes.InvalidArgument,
	ErrorCodeDogeWithEmailAlreadyExists: codes.AlreadyExists,
	ErrorCodeDogetagAlreadyExists:       codes.AlreadyExists,
	ErrorCodeEmptyEmailOrPassword:       codes.InvalidArgument,
	ErrorCodeInvalidCombination:         codes.InvalidArgument,
	ErrorCodeInvalidDogetagLength:       codes.InvalidArgument,
	ErrorCodeInvalidSource:              codes.InvalidArgument,
	ErrorCodeInvalidToken:               codes.Unauthenticated,
	ErrorCodeNoDoge:                     codes.Unauthenticated,
	ErrorCodeNoDogetag:                  codes.Unauthenticated,
	ErrorCodeNoExpand:                   codes.Internal,
	ErrorCodeNoIndividual:               codes.Unauthenticated,
	ErrorCodeNoRecipientDoge:            codes.InvalidArgument,
	ErrorCodeNotLoggedin:                codes.Unauthenticated,
	ErrorCodeNoSource:                   codes.InvalidArgument,
	ErrorCodePasswordLength:             codes.InvalidArgument,
	ErrorCodeRecipientNotOnboard:        codes.Unauthenticated,
	ErrorCodePaymentSource:              codes.Internal,
	ErrorCodeSelfTransfer:               codes.InvalidArgument,
	ErrorCodeSettingToken:               codes.Unknown,
	ErrorCodeStripe:                     codes.Internal,
	ErrorCodeUnknown:                    codes.Unknown,
	ErrorCodeYouHaveNoMoney:             codes.InvalidArgument,
	ErrorCodeFailedToVerify:             codes.InvalidArgument,
	ErrorCodeMaxAddCashOrPayout:         codes.PermissionDenied,
	ErrorCodeSpecialCharacters:          codes.InvalidArgument,
}

func GRPCError(code ErrorCode) error {
	return status.Error(mapErrorCode[code], errorMessage[code])
}
