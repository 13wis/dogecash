part of 'balance_bloc.dart';

@immutable
abstract class BalanceEvent extends Equatable {
  const BalanceEvent();

  @override
  List<Object> get props => [];
}

class GetBalance extends BalanceEvent {
  const GetBalance() : super();
}
