package tools

const (
	NoDoge                 string = "must include a doge to seed"
	CustomerAlreadyExists  string = "customer with email already created"
	InitialSeedDescription string = "Initial account seed"
	InvalidSourceType      string = "invalid cash out source"
	NoMatchingSource       string = "no matching payment source"
	NoSources              string = "no sources for customer"
	NoBalance              string = "no available balance for account"
	ChargeNotSucceeded     string = "uncaught charge that did not suceed"
	NoExternalAccounts     string = "no sources to cash out attached to account"
	TokenExpired           string = "login session has expired, please login again"
	TokenInvalid           string = "attempted to login using an invalid token, please login again"
	MinimumAmount          int64  = 50
	MaximumAmount          int64  = 999999
	Currency               string = "usd"
)
