part of 'confirmation_cubit.dart';

class ConfirmationCubitState extends Equatable {
  final int? amount;
  final String? note;
  final PayRequest_SourceType source;
  final int? to;
  final int? requestId;
  final Activity? activity;
  final bool loading;
  final bool success;
  final String? errorMessage;

  const ConfirmationCubitState(
      {this.amount,
      this.note,
      this.source = PayRequest_SourceType.account,
      this.to,
      this.requestId,
      this.activity,
      this.loading = false,
      this.success = false,
      this.errorMessage});

  ConfirmationCubitState copyWith(
      {int? amount,
      String? note,
      PayRequest_SourceType? source,
      int? to,
      int? requestId,
      Activity? activity,
      bool? loading,
      bool? success,
      String? errorMessage}) {
    return ConfirmationCubitState(
        amount: amount ?? this.amount,
        note: note ?? this.note,
        source: source ?? this.source,
        to: to ?? this.to,
        requestId: requestId ?? this.requestId,
        activity: activity ?? this.activity,
        loading: loading ?? this.loading,
        success: success ?? this.success,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [
        amount,
        note,
        source,
        to,
        requestId,
        activity,
        loading,
        success,
        errorMessage
      ];
}
