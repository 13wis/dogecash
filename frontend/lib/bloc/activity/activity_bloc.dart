import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/repos/activity_repository.dart';
import 'package:grpc/grpc.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository _activityRepository;

  ActivityBloc({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository,
        super(const ActivityState.unknown()) {
    on<GetActivity>(_onGetActivity);
  }

  void _onGetActivity(GetActivity event, Emitter emit) async {
    emit(const ActivityState.loading());
    try {
      final ActivityRepeated response = await _activityRepository.getActivity();
      return emit(ActivityState.successful(activity: response));
    } catch (error) {
      return emit(ActivityState.unsuccessful(
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
