part of 'external_bloc.dart';

@immutable
abstract class ExternalEvent extends Equatable {
  const ExternalEvent();

  @override
  List<Object> get props => [];
}

class GetExternalInfo extends ExternalEvent {
  const GetExternalInfo() : super();
}
