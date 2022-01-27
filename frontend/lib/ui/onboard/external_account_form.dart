import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/manage_external_account/manage_external_cubit.dart';
import 'package:frontend/ui/onboard/card_input.dart';
import 'package:frontend/ui/widgets/doge_button.dart';
import 'package:frontend/ui/widgets/progress_indicator.dart';

class AddExternalAccountForm
    extends BlocListener<ManageExternalCubit, ManageExternalState> {
  AddExternalAccountForm(
      {required VoidCallback onSubmissionSuccess,
      required Function(String?) onSubmissionFailure,
      Key? key})
      : super(
            listener: (context, state) {
              if (state.success == true) onSubmissionSuccess();
              if (state.success == false) {
                onSubmissionFailure(state.errorMessage);
              }
            },
            child: BlocBuilder<ManageExternalCubit, ManageExternalState>(
                builder: (context, state) {
              final cubit = context.read<ManageExternalCubit>();
              return Column(children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Add a card',
                        style: Theme.of(context).textTheme.headline4)),
                const SizedBox(height: GlobalSpacingFactor.four),
                CardInput(onCardChanged: cubit.cardChanged),
                const SizedBox(height: GlobalSpacingFactor.four),
                DogeButton('finish',
                    onPressed: state.card.complete
                        ? cubit.updateExternalAccount
                        : null,
                    child: state.loading == true
                        ? ModifiedProgressIndicator()
                        : null)
              ]);
            }),
            key: key);
}
