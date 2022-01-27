import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/models/enums.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/repos/auth_repository.dart';
import 'package:frontend/repos/viewer_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final ViewerRepository _viewerRepository;
  late final StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required ViewerRepository viewerRepository,
  })  : _authenticationRepository = authenticationRepository,
        _viewerRepository = viewerRepository,
        super(const AuthenticationState.unknown()) {
    on<GetInitialAuthenticationStatus>(_onGetInitialAuthenticationStatus);
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (event) => add(AuthenticationStatusChanged(event)),
    );
  }

  @override
  Future<void> close() async {
    await _authenticationStatusSubscription.cancel();
    await _authenticationRepository.dispose();
    return super.close();
  }

  void _onGetInitialAuthenticationStatus(
    GetInitialAuthenticationStatus _,
    Emitter<AuthenticationState> emit,
  ) async {
    return emit(await _tryGetCurrentViewer());
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        return emit(await _tryGetCurrentViewer());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) =>
      _authenticationRepository.signOut();

  Future<AuthenticationState> _tryGetCurrentViewer() async {
    try {
      final ViewerResponse? viewer = await _viewerRepository.getCurrentViewer();
      return AuthenticationState.authenticated(viewer);
    } catch (_) {
      return const AuthenticationState.unauthenticated();
    }
  }
}
