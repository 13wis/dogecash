import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:grpc/grpc.dart';

part 'my_doges_event.dart';
part 'my_doges_state.dart';

class MyDogesBloc extends Bloc<MyDogesEvent, MyDogesState> {
  final ViewerRepository _viewerRepository;

  MyDogesBloc({required ViewerRepository viewerRepository})
      : _viewerRepository = viewerRepository,
        super(const MyDogesState.unknown()) {
    on<GetMyDoges>(_onGetMyDoges);
  }

  void _onGetMyDoges(GetMyDoges event, Emitter emit) async {
    emit(const MyDogesState.loading());
    try {
      final MyDogesResponse response = await _viewerRepository.getMyDoges();
      return emit(MyDogesState.successful(doges: response));
    } catch (error) {
      return emit(MyDogesState.unsuccessful(
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
