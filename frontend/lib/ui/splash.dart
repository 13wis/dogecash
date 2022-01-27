import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/auth/auth_bloc.dart';
import 'package:frontend/models/enums.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/router/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          final Box doge = Hive.box('doge');
          final bool? isNewDoge = doge.get('isNewDoge');

          if (isNewDoge == null || isNewDoge == true) {
            doge.put('isNewDoge', false);
            AutoRouter.of(context).replace(const WelcomeScreenRoute());
          } else {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                final ViewerResponse? viewer = state.viewer;
                if (viewer == null) {
                  AutoRouter.of(context).replace(AuthScreenRoute(page: 1));
                } else if (viewer.doge.dogetag.isEmpty) {
                  AutoRouter.of(context).replace(OnboardScreenRoute());
                } else if (!viewer.stripeAccountCreated) {
                  AutoRouter.of(context)
                      .replace(OnboardScreenRoute(initialPage: 1));
                } else if (!viewer.externalAccountLinked) {
                  AutoRouter.of(context)
                      .replace(OnboardScreenRoute(initialPage: 2));
                } else {
                  AutoRouter.of(context).replace(const HomeScreenRoute());
                }
                break;
              case AuthenticationStatus.unauthenticated:
                AutoRouter.of(context).replace(AuthScreenRoute(page: 1));
                break;
              case AuthenticationStatus.unknown:
                break;
            }
          }
        },
        child: const Scaffold());
  }
}
