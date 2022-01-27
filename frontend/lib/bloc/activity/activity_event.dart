part of 'activity_bloc.dart';

@immutable
abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object?> get props => [];
}

class GetActivity extends ActivityEvent {
  final String? id;

  const GetActivity(this.id) : super();

  @override
  List<Object?> get props => [id];
}
