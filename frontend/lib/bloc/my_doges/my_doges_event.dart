part of 'my_doges_bloc.dart';

@immutable
abstract class MyDogesEvent extends Equatable {
  const MyDogesEvent();

  @override
  List<Object?> get props => [];
}

class GetMyDoges extends MyDogesEvent {
  const GetMyDoges() : super();
}
