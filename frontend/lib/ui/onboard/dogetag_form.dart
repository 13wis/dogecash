import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/update_dogetag/dogetag_cubit.dart';
import 'package:frontend/ui/onboard/dogetag_input.dart';
import 'package:frontend/ui/widgets/doge_button.dart';
import 'package:frontend/ui/widgets/progress_indicator.dart';

class UpdateDogetagForm
    extends BlocListener<UpdateDogetagCubit, UpdateDogetagState> {
  UpdateDogetagForm(
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
            child: BlocBuilder<UpdateDogetagCubit, UpdateDogetagState>(
                builder: (context, state) {
              final UpdateDogetagCubit cubit =
                  context.read<UpdateDogetagCubit>();
              return Column(children: [
                Wrap(runSpacing: GlobalSpacingFactor.one, children: [
                  Text('Create a dogetag',
                      style: Theme.of(context).textTheme.headline4),
                  Text("It can be changed later and can contain emojis 😬",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          height: 1.5, fontWeight: FontWeight.normal)),
                  const SizedBox(height: GlobalSpacingFactor.four * 4),
                  DogetagInput(
                      onChanged: (value) {
                        cubit.dogetagChanged(value);
                        if (value == null || value.length < 4) return;
                        cubit.getDogetagAvailability(value);
                      },
                      state: state)
                ]),
                const SizedBox(height: GlobalSpacingFactor.four),
                DogeButton("that's the one",
                    backgroundColor:
                        state.isSubmissionInProgress ? Colors.white : null,
                    onPressed: state.isValid || state.isSubmissionFailure
                        ? cubit.updateDogetag
                        : null,
                    child: state.isSubmissionInProgress
                        ? const CircularProgressIndicator(color: Colors.white)
                        : null)
              ]);
            }),
            key: key);
}
