import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frontend/proto/dogecash.pb.dart';
import 'package:frontend/ui/auth/auth_screen.dart';
import 'package:frontend/ui/home/home_screen.dart';
import 'package:frontend/ui/onboard/onboard_screen.dart';
import 'package:frontend/ui/splash.dart';
import 'package:frontend/ui/welcome/welcome_screen.dart';

part 'app_router.gr.dart';

Widget fadeThroughTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child);
}

@MaterialAutoRouter(
  replaceInRouteName: 'Screen',
  routes: <AutoRoute>[
    CustomRoute(page: SplashScreen, initial: true, transitionsBuilder: null),
    CustomRoute(page: WelcomeScreen, transitionsBuilder: null),
    CustomRoute(page: AuthScreen, transitionsBuilder: fadeThroughTransition),
    CustomRoute(page: OnboardScreen, transitionsBuilder: fadeThroughTransition),
    CustomRoute(page: HomeScreen, transitionsBuilder: fadeThroughTransition),
    CustomRoute(
        page: SearchDogeScreen, transitionsBuilder: fadeThroughTransition),
    CustomRoute(
        page: ConfirmationScreen, transitionsBuilder: fadeThroughTransition),
    CustomRoute(
        page: ActivityListScreen, transitionsBuilder: fadeThroughTransition),
    AutoRoute(page: ActivityDetailScreen, fullscreenDialog: true),
    AutoRoute(page: AddCashScreen, fullscreenDialog: true),
    AutoRoute(page: CashOutScreen, fullscreenDialog: true)
  ],
)
class AppRouter extends _$AppRouter {}
