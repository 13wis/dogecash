package tools

import (
	"errors"
	"fmt"
	"os"
	"strings"
	"time"

	"github.com/golang-jwt/jwt"
)

type SignJwtParams struct {
	AccountID  *string
	CustomerID *string
	Dogetag    *string
	DogeID     int64
	IchID      *string
	CardID     *string
}

type Claims struct {
	SignJwtParams
	jwt.StandardClaims
}

var signingKey = os.Getenv("SIGNING_KEY")

func SignJwt(sjwtp *SignJwtParams) (*string, error) {
	claims := &Claims{
		SignJwtParams: SignJwtParams{
			AccountID:  sjwtp.AccountID,
			CustomerID: sjwtp.CustomerID,
			Dogetag:    sjwtp.Dogetag,
			DogeID:     sjwtp.DogeID,
			IchID:      sjwtp.IchID,
			CardID:     sjwtp.CardID,
		},
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Hour * 24 * 30).Unix(),
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	signed, err := token.SignedString([]byte(signingKey))
	if err != nil {
		return nil, err
	}

	return &signed, nil
}

func VerifyJwt(tokenString string) (*Claims, error) {
	bearer := strings.TrimPrefix(tokenString, "Bearer ")
	claims := &Claims{}
	token, err := jwt.ParseWithClaims(bearer, claims, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}

		return []byte(signingKey), nil
	})
	if err != nil || !token.Valid {
		if claims != nil && time.Now().Unix() > claims.ExpiresAt {
			return nil, errors.New(TokenExpired)
		}
		return nil, err
	}

	return claims, nil
}
