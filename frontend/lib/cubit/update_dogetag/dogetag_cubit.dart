import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/models/dogetag.dart';
import 'package:frontend/models/enums.dart';
import 'package:frontend/repos/dogetag_repository.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:grpc/grpc.dart';

part 'dogetag_state.dart';

class UpdateDogetagCubit extends Cubit<UpdateDogetagState> {
  final DogetagRepository _dogetagRepository;
  final ViewerRepository _viewerRepository;
  late final StreamSubscription<DogetagAvailability> _availabilitySubscription;

  UpdateDogetagCubit(
      {required DogetagRepository dogetagRepository,
      required ViewerRepository viewerRepository})
      : _dogetagRepository = dogetagRepository,
        _viewerRepository = viewerRepository,
        super(const UpdateDogetagState()) {
    _availabilitySubscription = _dogetagRepository.availability
        .listen((event) => emit(state.copyWith(availability: event)));
  }

  @override
  Future<void> close() async {
    await _availabilitySubscription.cancel();
    return super.close();
  }

  void dogetagChanged(String? value) {
    final dogetag = Dogetag.dirty(value);
    emit(state.copyWith(dogetag: dogetag, status: Formz.validate([dogetag])));
  }

  void getDogetagAvailability(String value) async {
    try {
      await _dogetagRepository.getAvailability(dogetag: value);
    } catch (_) {
      emit(state.copyWith(availability: DogetagAvailability.unknown));
    }
  }

  Future<void> updateDogetag() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _viewerRepository.updateDogetag(dogetag: state.dogetag.value ?? '');
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
