part of 'auth_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final ViewerResponse? viewer;

  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.viewer});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(ViewerResponse? viewer)
      : this._(status: AuthenticationStatus.authenticated, viewer: viewer);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, viewer];
}
