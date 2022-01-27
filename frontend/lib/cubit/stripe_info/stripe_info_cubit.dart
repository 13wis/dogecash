import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/models/first_name.dart';
import 'package:frontend/models/last_name.dart';
import 'package:frontend/models/address.dart';
import 'package:frontend/repos/address_repository.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:grpc/grpc.dart';

part 'stripe_info_state.dart';

class UpdateStripeInfoCubit extends Cubit<UpdateStripeInfoState> {
  final ViewerRepository _viewerRepository;
  final AddressRepository _addressRepository;

  UpdateStripeInfoCubit(
      {required ViewerRepository viewerRepository,
      required AddressRepository addressRepository})
      : _viewerRepository = viewerRepository,
        _addressRepository = addressRepository,
        super(UpdateStripeInfoState()) {
    _addressRepository.listenForPredictions();
    _addressRepository.response
        .listen((event) => emit(state.copyWith(addresses: event.description)));
  }

  void dobChanged(DateTime value) => emit(state.copyWith(dob: value));

  void firstNameChanged(String? value) {
    final firstName = FirstName.dirty(value);
    emit(state.copyWith(
        firstName: firstName,
        status: Formz.validate([firstName, state.lastName, state.address])));
  }

  void lastNameChanged(String? value) {
    final lastName = LastName.dirty(value);
    emit(state.copyWith(
        lastName: lastName,
        status: Formz.validate([lastName, state.firstName, state.address])));
  }

  void addressChanged(String? value) {
    if (value?.isNotEmpty == true) {
      _addressRepository.addPredictionRequest(value);
    }
    final address = Address.dirty(value);
    emit(state.copyWith(
        address: address,
        status: Formz.validate([address, state.firstName, state.lastName])));
  }

  void updateStripeInfo({bool create = true}) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      // For the time being we don't care about the address -- it's not used
      // by the server for simplicities sake (everything else has been made
      // overly complex though...)
      await _viewerRepository.updateStripeInfo(
          create: create,
          dob: state.dob,
          firstName: state.firstName.value,
          lastName: state.lastName.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (error) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage:
              error is GrpcError ? error.message : ErrorMessage.generic));
    }
  }
}
