import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:grpc/grpc.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final ViewerRepository _viewerRepository;

  CardBloc({required ViewerRepository viewerRepository})
      : _viewerRepository = viewerRepository,
        super(const CardState.unknown()) {
    on<GetCardInfo>(_onGetCardInfo);
  }

  void _onGetCardInfo(GetCardInfo event, Emitter<CardState> emit) async {
    emit(const CardState.loading());
    try {
      final DogeCardResponse response =
          await _viewerRepository.getCardInfo(full: event.full);
      return emit(CardState.successful(card: response));
    } catch (error) {
      return emit(CardState.unsuccessful(
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
