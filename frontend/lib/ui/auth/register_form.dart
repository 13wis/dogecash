import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/register/register_cubit.dart';
import 'package:frontend/models/enums.dart';
import 'package:frontend/ui/auth/email_input.dart';
import 'package:frontend/ui/auth/password_input.dart';
import 'package:frontend/ui/widgets/doge_button.dart';
import 'package:frontend/ui/widgets/progress_indicator.dart';

class RegisterForm extends BlocListener<RegisterCubit, RegisterState> {
  RegisterForm(
      {required GestureRecognizer recognizer,
      required VoidCallback onSubmissionSuccess,
      required Function(String?) onSubmissionFailure,
      Key? key})
      : super(
            listener: (context, state) {
              if (state.isSubmissionSuccess) onSubmissionSuccess();
              if (state.isSubmissionFailure) {
                onSubmissionFailure(state.errorMessage);
              }
            },
            child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
              final RegisterCubit cubit = context.read<RegisterCubit>();
              return Column(children: [
                Wrap(runSpacing: GlobalSpacingFactor.one, children: [
                  Text("Let's begin! 😄",
                      style: Theme.of(context).textTheme.headline4),
                  Text(
                      'Enter a valid email address and create a password to begin',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          height: 1.5, fontWeight: FontWeight.normal)),
                  const SizedBox(height: GlobalSpacingFactor.four * 3),
                  EmailInput(onChanged: cubit.emailChanged),
                  PasswordInput(
                      onChanged: cubit.passwordChanged,
                      onIconTapped: cubit.toggleVisibility,
                      isPasswordVisible: state.isPasswordVisible)
                ]),
                const SizedBox(height: GlobalSpacingFactor.two),
                FilterChips(state: state),
                const SizedBox(height: GlobalSpacingFactor.four),
                Wrap(runSpacing: GlobalSpacingFactor.two, children: [
                  DogeButton('continue',
                      backgroundColor:
                          state.isSubmissionInProgress ? Colors.white : null,
                      onPressed: state.isValid || state.isSubmissionFailure
                          ? cubit.register
                          : null,
                      child: state.isSubmissionInProgress
                          ? ModifiedProgressIndicator()
                          : null),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.bodyText2),
                    TextSpan(
                        text: 'Sign In.',
                        recognizer: recognizer,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.bold))
                  ]))
                ])
              ]);
            }),
            key: key);
}

class FilterChips extends StatelessWidget {
  final RegisterState state;

  static const List<String> label = [
    'Email valid',
    'At least 8 characters',
    'At least 1 digit',
    'At least 1 special character'
  ];

  const FilterChips({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: GlobalSpacingFactor.one,
        children: List<Widget>.generate(label.length, (index) {
          return FilterChip(
              label: Text(label[index]),
              onSelected: (_) {},
              selectedColor: Colors.green,
              selected: index == 0
                  ? state.email.error == null
                  : state.password.error == null ||
                      !state.password.error!
                          .contains(PasswordValidationError.values[index - 1]));
        }));
  }
}
