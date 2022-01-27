import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/proto/dogecash.pb.dart';
import 'package:frontend/repos/transfer_repositiory.dart';
import 'package:grpc/grpc.dart';

part 'confirmation_state.dart';

class ConfirmationCubit extends Cubit<ConfirmationCubitState> {
  final TransferRepository _transferRepository;

  ConfirmationCubit({required TransferRepository transferRepository})
      : _transferRepository = transferRepository,
        super(const ConfirmationCubitState());

  void reset() => emit(const ConfirmationCubitState());

  void updateSource(PayRequest_SourceType source) =>
      emit(state.copyWith(source: source));

  void submitPayment(
      {required int amount,
      String? note,
      required PayRequest_SourceType source,
      required int to,
      int? requestId}) async {
    emit(state.copyWith(loading: true, success: false, activity: null));
    try {
      final Activity response =
          await _transferRepository.pay(amount, note, source, to, requestId);
      emit(state.copyWith(loading: false, success: true, activity: response));
    } catch (error) {
      emit(state.copyWith(
          success: false,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  void submitRequest(
      {required int amount, String? note, required int to}) async {
    emit(state.copyWith(loading: true, success: false, activity: null));
    try {
      final Activity response =
          await _transferRepository.request(amount, note, to);
      emit(state.copyWith(loading: false, success: true, activity: response));
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
