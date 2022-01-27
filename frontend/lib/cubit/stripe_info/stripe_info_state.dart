part of 'stripe_info_cubit.dart';

class UpdateStripeInfoState extends Equatable {
  final FormzStatus status;
  final DateTime dob;
  final FirstName firstName;
  final LastName lastName;
  final Address address;
  final List<String> addresses;
  final String? errorMessage;

  UpdateStripeInfoState({
    this.status = FormzStatus.pure,
    DateTime? dob,
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.address = const Address.pure(),
    this.addresses = const [],
    this.errorMessage,
  }) : dob = dob ?? DateTime(1901);

  UpdateStripeInfoState copyWith({
    FormzStatus? status,
    DateTime? dob,
    FirstName? firstName,
    LastName? lastName,
    Address? address,
    List<String>? addresses,
    String? errorMessage,
  }) {
    return UpdateStripeInfoState(
        status: status ?? this.status,
        dob: dob,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        address: address ?? this.address,
        addresses: addresses ?? this.addresses,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  bool get isValid => status == FormzStatus.valid;
  bool get isSubmissionInProgress => status == FormzStatus.submissionInProgress;
  bool get isSubmissionFailure => status == FormzStatus.submissionFailure;
  bool get isSubmissionSuccess => status == FormzStatus.submissionSuccess;

  @override
  List<Object?> get props =>
      [status, firstName, lastName, address, addresses, dob, errorMessage];
}
