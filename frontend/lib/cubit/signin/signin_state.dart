part of 'signin_cubit.dart';

class SignInState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool isPasswordVisible;
  final String? errorMessage;

  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.isPasswordVisible = false,
    this.errorMessage,
  });

  SignInState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? isPasswordVisible,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isValid => status == FormzStatus.valid;
  bool get isSubmissionInProgress => status == FormzStatus.submissionInProgress;
  bool get isSubmissionFailure => status == FormzStatus.submissionFailure;
  bool get isSubmissionSuccess => status == FormzStatus.submissionSuccess;

  @override
  List<Object?> get props =>
      [email, password, status, isPasswordVisible, errorMessage];
}
