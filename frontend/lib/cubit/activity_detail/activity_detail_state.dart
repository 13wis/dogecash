part of 'activity_detail_cubit.dart';

class ActivityDetailState extends Equatable {
  final Activity? activity;
  final bool loading;
  final bool success;
  final String? errorMessage;

  const ActivityDetailState(
      {this.activity,
      this.loading = false,
      this.success = false,
      this.errorMessage});

  ActivityDetailState copyWith(
      {Activity? activity,
      bool? loading,
      bool? success,
      String? errorMessage}) {
    return ActivityDetailState(
        activity: activity ?? this.activity,
        loading: loading ?? this.loading,
        success: success ?? this.success,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [activity, loading, success, errorMessage];
}
