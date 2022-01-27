import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/models/email.dart';
import 'package:frontend/models/enums.dart';
import 'package:frontend/models/password.dart';
import 'package:frontend/repos/auth_repository.dart';
import 'package:grpc/grpc.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthenticationRepository _authenticationRepository;

  SignInCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const SignInState());

  void emailChanged(String? value) {
    final email = Email.dirty(value);
    final String? password = state.password.value;
    final String? emailStr = email.value;
    emit(state.copyWith(
        email: email,
        status: emailStr != null &&
                emailStr.isNotEmpty &&
                password != null &&
                password.isNotEmpty
            ? FormzStatus.valid
            : FormzStatus.invalid));
  }

  void passwordChanged(String? value) {
    final password = Password.dirty(value);
    final String? email = state.email.value;
    final String? passwordStr = password.value;
    emit(state.copyWith(
        password: password,
        status: passwordStr != null &&
                passwordStr.isNotEmpty &&
                email != null &&
                email.isNotEmpty
            ? FormzStatus.valid
            : FormzStatus.invalid));
  }

  void toggleVisibility() =>
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));

  Future<void> signIn() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.attemptAuthentication(
          email: state.email.value ?? '',
          password: state.password.value ?? '',
          formType: FormType.signIn);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
