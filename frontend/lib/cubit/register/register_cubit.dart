import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/models/email.dart';
import 'package:frontend/models/enums.dart';
import 'package:frontend/models/password.dart';
import 'package:frontend/repos/auth_repository.dart';
import 'package:grpc/grpc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationRepository _authenticationRepository;

  RegisterCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const RegisterState());

  void emailChanged(String? value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email, status: Formz.validate([email, state.password])));
  }

  void passwordChanged(String? value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password, status: Formz.validate([state.email, password])));
  }

  void toggleVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> register() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.attemptAuthentication(
          email: state.email.value ?? '',
          password: state.password.value ?? '',
          formType: FormType.register);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
