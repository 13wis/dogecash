part of 'activity_bloc.dart';

class ActivityState extends Equatable {
  final ActivityRepeated? repeated;
  final bool loading;
  final String? errorMessage;

  const ActivityState._(
      {this.repeated, this.loading = false, this.errorMessage});

  const ActivityState.unknown() : this._();

  const ActivityState.loading() : this._(loading: true);

  const ActivityState.successful({required ActivityRepeated activity})
      : this._(loading: false, repeated: activity);

  const ActivityState.unsuccessful({String? errorMessage})
      : this._(loading: false, errorMessage: errorMessage);

  bool get isUnknown =>
      repeated == null && errorMessage == null && loading == false;
  bool get isLoading => loading == true;
  bool get isSuccessful => loading == false && repeated != null;
  bool get isUnsuccessful => loading == false && errorMessage != null;

  @override
  List<Object?> get props => [repeated, loading, errorMessage];
}
