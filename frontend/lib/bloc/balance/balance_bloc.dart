import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:grpc/grpc.dart';

part 'balance_events.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final ViewerRepository _viewerRepository;

  BalanceBloc({required ViewerRepository viewerRepository})
      : _viewerRepository = viewerRepository,
        super(const BalanceState.unknown()) {
    on<GetBalance>(_onGetBalance);
  }

  void _onGetBalance(GetBalance event, Emitter<BalanceState> emit) async {
    emit(const BalanceState.loading());
    try {
      final BalanceResponse response =
          await _viewerRepository.getCurrentBalance();
      return emit(BalanceState.successful(balance: response.balance.toInt()));
    } catch (error) {
      return emit(BalanceState.unsuccessful(
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
