import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/router/app_router.dart';
import 'package:frontend/ui/onboard/dogetag_form.dart';
import 'package:frontend/ui/onboard/external_account_form.dart';
import 'package:frontend/ui/onboard/stripe_account_form.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnboardScreen extends StatefulWidget {
  final int initialPage;

  const OnboardScreen({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late int _currentPage;
  late OverlayEntry overlay;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  void _nextPage() => setState(() => _currentPage++);

  void _completeOnboarding() =>
      AutoRouter.of(context).replaceAll([const HomeScreenRoute()]);

  void _showSnackbar(String? error) {
    final TextStyle style = Theme.of(context).textTheme.bodyText1!;
    final Widget content = Wrap(runSpacing: GlobalSpacingFactor.one, children: [
      RichText(
          text: TextSpan(children: [
        const WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: FaIcon(FontAwesomeIcons.exclamationTriangle,
                color: Colors.white, size: 14.0)),
        TextSpan(
            text: ' Error', style: style.copyWith(fontWeight: FontWeight.bold))
      ])),
      const SizedBox(width: double.infinity),
      Text(error ?? ErrorMessage.genericUnknown,
          textAlign: TextAlign.left, style: style)
    ]);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Container(child: content)));
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> pages = {
      0: UpdateDogetagForm(
          onSubmissionFailure: _showSnackbar, onSubmissionSuccess: _nextPage),
      1: StripeInfoForm(
          onSubmissionFailure: _showSnackbar, onSubmissionSuccess: _nextPage),
      2: AddExternalAccountForm(
          onSubmissionFailure: _showSnackbar,
          onSubmissionSuccess: _completeOnboarding)
    };

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepProgressIndicator(
                      totalSteps: 3,
                      currentStep: _currentPage + 1,
                      roundedEdges: const Radius.circular(4.0)),
                  Text('Step ${_currentPage + 1} of 3')
                ])),
        body: SafeArea(
            child: PageTransitionSwitcher(
                transitionBuilder: (child, animation, secondaryAnimation) =>
                    SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                        child: child),
                child: SingleChildScrollView(
                    key: ValueKey<int>(_currentPage),
                    child: Container(
                        color: DogeColors.background,
                        padding: const EdgeInsets.all(16.0),
                        child: pages[_currentPage])))));
  }
}
