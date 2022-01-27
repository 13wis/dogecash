part of 'dogetag_cubit.dart';

class UpdateDogetagState extends Equatable {
  final Dogetag dogetag;
  final FormzStatus status;
  final DogetagAvailability availability;
  final String? errorMessage;

  const UpdateDogetagState(
      {this.dogetag = const Dogetag.pure(),
      this.status = FormzStatus.pure,
      this.availability = DogetagAvailability.unknown,
      this.errorMessage});

  UpdateDogetagState copyWith(
      {Dogetag? dogetag,
      FormzStatus? status,
      DogetagAvailability? availability,
      String? errorMessage}) {
    return UpdateDogetagState(
        dogetag: dogetag ?? this.dogetag,
        status: status ?? this.status,
        availability: availability ?? this.availability,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  bool get isLoading => availability == DogetagAvailability.loading;
  bool get isAvailable => availability == DogetagAvailability.available;
  bool get isUnavailable => availability == DogetagAvailability.unavailable;
  bool get isValid => status == FormzStatus.valid;
  bool get isSubmissionInProgress => status == FormzStatus.submissionInProgress;
  bool get isSubmissionFailure => status == FormzStatus.submissionFailure;
  bool get isSubmissionSuccess => status == FormzStatus.submissionSuccess;

  @override
  List<Object?> get props => [dogetag, status, availability, errorMessage];
}
