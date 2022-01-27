import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/proto/dogecash.pb.dart';
import 'package:frontend/repos/activity_repository.dart';
import 'package:grpc/grpc.dart';

part 'activity_detail_state.dart';

class ActivityDetailCubit extends Cubit<ActivityDetailState> {
  final ActivityRepository _activityRepository;

  ActivityDetailCubit({required ActivityRepository activityRepository})
      : _activityRepository = activityRepository,
        super(const ActivityDetailState());

  void getByActivityId({required int id}) async {
    emit(state.copyWith(loading: true));
    try {
      final ActivityRepeated response =
          await _activityRepository.getActivity(activity: id);
      return emit(state.copyWith(
          loading: false, activity: response.activity.first, success: true));
    } catch (error) {
      return emit(state.copyWith(
          loading: false,
          success: false,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }

  void getByPeerId({required int id}) async {
    emit(state.copyWith(loading: true));
    try {
      final ActivityRepeated response =
          await _activityRepository.getActivity(peer: id);
      return emit(state.copyWith(
          loading: false, activity: response.activity.first, success: true));
    } catch (error) {
      return emit(state.copyWith(
          loading: false,
          success: false,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
