part of 'manage_external_cubit.dart';

class ManageExternalState extends Equatable {
  final CardFieldInputDetails card;
  final bool? loading;
  final bool? success;
  final String? errorMessage;

  const ManageExternalState(
      {this.card = const CardFieldInputDetails(complete: false),
      this.loading,
      this.success,
      this.errorMessage});

  ManageExternalState copyWith(
      {CardFieldInputDetails? card,
      bool? loading,
      bool? success,
      String? errorMessage}) {
    return ManageExternalState(
        card: card ?? this.card,
        loading: loading ?? this.loading,
        success: success ?? this.success,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [card, errorMessage];
}
