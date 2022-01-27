import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/stripe_info/stripe_info_cubit.dart';
import 'package:frontend/ui/onboard/dob_input.dart';
import 'package:frontend/ui/onboard/first_name_input.dart';
import 'package:frontend/ui/onboard/last_name_input.dart';
import 'package:frontend/ui/onboard/address_input.dart';
import 'package:frontend/ui/widgets/doge_button.dart';
import 'package:frontend/ui/widgets/progress_indicator.dart';

class StripeInfoForm
    extends BlocListener<UpdateStripeInfoCubit, UpdateStripeInfoState> {
  StripeInfoForm(
      {required VoidCallback onSubmissionSuccess,
      required Function(String?) onSubmissionFailure,
      Key? key})
      : super(
            listener: (context, state) {
              if (state.isSubmissionSuccess) onSubmissionSuccess();
              if (state.isSubmissionFailure) {
                onSubmissionFailure(state.errorMessage);
              }
            },
            child: BlocBuilder<UpdateStripeInfoCubit, UpdateStripeInfoState>(
                builder: (context, state) {
              final cubit = context.read<UpdateStripeInfoCubit>();
              return SingleChildScrollView(
                  child: Column(children: [
                Wrap(runSpacing: GlobalSpacingFactor.one, children: [
                  Text('Tell us about yourself',
                      style: Theme.of(context).textTheme.headline4),
                  Text('Stripe requires this information',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(height: 1.5, fontWeight: FontWeight.normal))
                ]),
                const SizedBox(height: GlobalSpacingFactor.four),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: FirstNameInput(
                              onChanged: cubit.firstNameChanged,
                              valid: state.firstName.error == null)),
                      const SizedBox(width: GlobalSpacingFactor.one),
                      Flexible(
                          child: LastNameInput(
                              onChanged: cubit.lastNameChanged,
                              valid: state.lastName.error == null))
                    ]),
                const SizedBox(height: GlobalSpacingFactor.one),
                AddressInput(
                    onChanged: cubit.addressChanged,
                    valid: state.address.error == null,
                    predictions: state.addresses),
                const SizedBox(height: GlobalSpacingFactor.one),
                DobInput(dob: state.dob, onDateTimeChanged: cubit.dobChanged),
                const SizedBox(height: GlobalSpacingFactor.four),
                DogeButton('this looks accurate 👍',
                    backgroundColor:
                        state.isSubmissionInProgress ? Colors.white : null,
                    onPressed: state.isValid || state.isSubmissionFailure
                        ? cubit.updateStripeInfo
                        : null,
                    child: state.isSubmissionInProgress
                        ? ModifiedProgressIndicator()
                        : null)
              ]));
            }),
            key: key);
}
