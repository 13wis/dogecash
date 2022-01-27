package interceptors

import "google.golang.org/grpc"

func StreamInterceptor(
	srv interface{},
	ss grpc.ServerStream,
	info *grpc.StreamServerInfo,
	handler grpc.StreamHandler) error {
	panic("Unimplemented")
}
