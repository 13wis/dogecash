import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:grpc/grpc.dart';

part 'manage_external_state.dart';

class ManageExternalCubit extends Cubit<ManageExternalState> {
  final ViewerRepository _viewerRepository;

  ManageExternalCubit({required ViewerRepository viewerRepository})
      : _viewerRepository = viewerRepository,
        super(const ManageExternalState());

  void cardChanged(CardFieldInputDetails? card) =>
      emit(state.copyWith(card: card));

  void updateExternalAccount() async {
    emit(state.copyWith(loading: true, success: null));
    try {
      await _viewerRepository.updateExternalAccount();
      emit(state.copyWith(success: true));
    } catch (error) {
      emit(state.copyWith(
          success: false,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
