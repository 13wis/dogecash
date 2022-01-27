part of 'balance_bloc.dart';

class BalanceState extends Equatable {
  final int? balance;
  final bool loading;
  final String? errorMessage;

  const BalanceState._({this.balance, this.loading = false, this.errorMessage});

  const BalanceState.unknown() : this._();

  const BalanceState.loading() : this._(loading: true);

  const BalanceState.successful({required int balance})
      : this._(loading: false, balance: balance);

  const BalanceState.unsuccessful({String? errorMessage})
      : this._(loading: false, errorMessage: errorMessage);

  bool get isUnknown =>
      balance == null && errorMessage == null && loading == false;
  bool get isLoading => loading == true;
  bool get isSuccessful => loading == false && balance != null;
  bool get isUnsuccessful => loading == false && errorMessage != null;

  @override
  List<Object?> get props => [balance, loading, errorMessage];
}
