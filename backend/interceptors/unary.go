package interceptors

import (
	"context"
	"log"
	"time"

	"github.com/l3wis/dogecash/tools"
	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"
)

type key int

const Key key = 0

func execHandler(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	t := time.Now()
	h, err := handler(ctx, req)

	total := time.Since(t).Milliseconds()
	log.Printf("[GRPC] %vms | %s", total, info.FullMethod)

	return h, err
}

func AddClaimsToContext(
	ctx context.Context,
	req interface{},
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler) (interface{}, error) {
	headers, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return execHandler(ctx, req, info, handler)
	}

	token := headers["authorization"]
	if len(token) > 0 {
		claims, err := tools.VerifyJwt(token[0])
		if err != nil {
			return execHandler(ctx, req, info, handler)
		}

		ctx := context.WithValue(ctx, Key, claims)

		return execHandler(ctx, req, info, handler)
	}

	return execHandler(ctx, req, info, handler)
}
