part of 'external_bloc.dart';

class ExternalState extends Equatable {
  final ExternalAccountsResponse? external;
  final bool loading;
  final String? errorMessage;

  const ExternalState._(
      {this.external, this.loading = false, this.errorMessage});

  const ExternalState.unknown() : this._();

  const ExternalState.loading() : this._(loading: true);

  const ExternalState.successful({required ExternalAccountsResponse external})
      : this._(loading: false, external: external);

  const ExternalState.unsuccessful({String? errorMessage})
      : this._(loading: false, errorMessage: errorMessage);

  bool get isUnknown =>
      external == null && errorMessage == null && loading == false;
  bool get isLoading => loading == true;
  bool get isSuccessful => loading == false && external != null;
  bool get isUnsuccessful => loading == false && errorMessage != null;

  @override
  List<Object?> get props => [external, loading, errorMessage];
}
