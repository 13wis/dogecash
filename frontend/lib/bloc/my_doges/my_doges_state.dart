part of 'my_doges_bloc.dart';

class MyDogesState extends Equatable {
  final MyDogesResponse? doges;
  final bool loading;
  final String? errorMessage;

  const MyDogesState._({this.doges, this.loading = false, this.errorMessage});

  const MyDogesState.unknown() : this._();

  const MyDogesState.loading() : this._(loading: true);

  const MyDogesState.successful({required MyDogesResponse doges})
      : this._(loading: false, doges: doges);

  const MyDogesState.unsuccessful({String? errorMessage})
      : this._(loading: false, errorMessage: errorMessage);

  bool get isUnknown =>
      doges == null && errorMessage == null && loading == false;
  bool get isLoading => loading == true;
  bool get isSuccessful => loading == false && doges != null;
  bool get isUnsuccessful => loading == false && errorMessage != null;

  @override
  List<Object?> get props => [doges, loading, errorMessage];
}
