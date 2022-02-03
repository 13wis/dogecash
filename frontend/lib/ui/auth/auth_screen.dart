import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/errors.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/router/app_router.dart';
import 'package:frontend/ui/auth/register_form.dart';
import 'package:frontend/ui/auth/sign_in_form.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthScreen extends StatefulWidget {
  final int? page;

  const AuthScreen({this.page, Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late int _page;
  late final String _name;

  @override
  void initState() {
    super.initState();
    final Box box = Hive.box('doge');
    _name = box.get('name') ?? '';
    _page = widget.page ?? 0;
  }

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

  void togglePage() => setState(() => _page = 1 >> _page);

  @override
  Widget build(BuildContext context) {
    final GestureRecognizer recognizer = TapGestureRecognizer()
      ..onTap = togglePage;
    final Map<int, Widget> forms = {
      0: RegisterForm(
          onSubmissionSuccess: () async =>
              await AutoRouter.of(context).replaceAll([OnboardScreenRoute()]),
          onSubmissionFailure: _showSnackbar,
          recognizer: recognizer),
      1: SignInForm(
          onSubmissionSuccess: () async => await AutoRouter.of(context)
              .replaceAll([const HomeScreenRoute()]),
          onSubmissionFailure: _showSnackbar,
          name: _name,
          recognizer: recognizer)
    };

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: togglePage,
                child: const Align(
                    alignment: Alignment.center,
                    child: FaIcon(FontAwesomeIcons.chevronLeft))),
            backgroundColor: Colors.transparent,
            elevation: 0.0),
        body: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) =>
                SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    fillColor: DogeColors.background,
                    child: child),
            child: Container(
                key: ValueKey<int>(_page),
                color: DogeColors.background,
                padding: const EdgeInsets.all(16.0),
                child: forms[_page]!)));
  }
}
