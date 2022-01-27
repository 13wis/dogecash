part of 'card_bloc.dart';

class CardState extends Equatable {
  final DogeCardResponse? card;
  final bool loading;
  final String? errorMessage;

  const CardState._({this.card, this.loading = false, this.errorMessage});

  const CardState.unknown() : this._();

  const CardState.loading() : this._(loading: true);

  const CardState.successful({required DogeCardResponse card})
      : this._(loading: false, card: card);

  const CardState.unsuccessful({String? errorMessage})
      : this._(loading: false, errorMessage: errorMessage);

  bool get isUnknown =>
      card == null && errorMessage == null && loading == false;
  bool get isLoading => loading == true;
  bool get isSuccessful => loading == false && card != null;
  bool get isUnsuccessful => loading == false && errorMessage != null;

  @override
  List<Object?> get props => [card, loading, errorMessage];
}
