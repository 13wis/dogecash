part of 'card_bloc.dart';

@immutable
abstract class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

class GetCardInfo extends CardEvent {
  final bool full;

  const GetCardInfo(this.full) : super();

  @override
  List<Object> get props => [full];
}
