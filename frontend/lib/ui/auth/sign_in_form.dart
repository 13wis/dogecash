import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/signin/signin_cubit.dart';
import 'package:frontend/ui/auth/email_input.dart';
import 'package:frontend/ui/auth/password_input.dart';
import 'package:frontend/ui/widgets/doge_button.dart';
import 'package:frontend/ui/widgets/progress_indicator.dart';

class SignInForm extends BlocListener<SignInCubit, SignInState> {
  SignInForm(
      {required VoidCallback onSubmissionSuccess,
      required Function(String?) onSubmissionFailure,
      required String name,
      required GestureRecognizer recognizer,
      Key? key})
      : super(
            listener: (context, state) {
              if (state.isSubmissionSuccess) onSubmissionSuccess();
              if (state.isSubmissionFailure) {
                onSubmissionFailure(state.errorMessage);
              }
            },
            child: BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
              final SignInCubit cubit = context.read<SignInCubit>();
              return Column(children: [
                Wrap(runSpacing: GlobalSpacingFactor.one, children: [
                  Text('Welcome back${name.isNotEmpty ? ', $name' : ''}!',
                      style: Theme.of(context).textTheme.headline4),
                  Text(
                      "Let's get back to business.\nSign in to access your account",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          height: 1.5, fontWeight: FontWeight.normal)),
                  const SizedBox(height: GlobalSpacingFactor.four * 3),
                  EmailInput(onChanged: cubit.emailChanged),
                  PasswordInput(
                      onChanged: cubit.passwordChanged,
                      onIconTapped: cubit.toggleVisibility,
                      isPasswordVisible: state.isPasswordVisible)
                ]),
                const SizedBox(height: GlobalSpacingFactor.four),
                Wrap(runSpacing: GlobalSpacingFactor.two, children: [
                  DogeButton('sign in',
                      backgroundColor:
                          state.isSubmissionInProgress ? Colors.white : null,
                      onPressed: state.isValid || state.isSubmissionFailure
                          ? cubit.signIn
                          : null,
                      child: state.isSubmissionInProgress
                          ? ModifiedProgressIndicator()
                          : null),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyText2),
                    TextSpan(
                        text: 'Register.',
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
