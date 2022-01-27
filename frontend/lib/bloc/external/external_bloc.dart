import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:grpc/grpc.dart';

part 'external_event.dart';
part 'external_state.dart';

class ExternalBloc extends Bloc<ExternalEvent, ExternalState> {
  final ViewerRepository _viewerRepository;

  ExternalBloc({required ViewerRepository viewerRepository})
      : _viewerRepository = viewerRepository,
        super(const ExternalState.unknown()) {
    on<GetExternalInfo>(_onGetExternalInfo);
  }

  void _onGetExternalInfo(
      GetExternalInfo event, Emitter<ExternalState> emit) async {
    emit(const ExternalState.loading());
    try {
      final ExternalAccountsResponse response =
          await _viewerRepository.getExternalAccounts();
      return emit(ExternalState.successful(external: response));
    } catch (error) {
      return emit(ExternalState.unsuccessful(
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
