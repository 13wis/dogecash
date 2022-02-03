// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SplashScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    WelcomeScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const WelcomeScreen(),
          opaque: true,
          barrierDismissible: false);
    },
    AuthScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AuthScreenRouteArgs>(
          orElse: () => const AuthScreenRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: AuthScreen(page: args.page, key: args.key),
          transitionsBuilder: fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    OnboardScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardScreenRouteArgs>(
          orElse: () => const OnboardScreenRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: OnboardScreen(key: args.key, initialPage: args.initialPage),
          transitionsBuilder: fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    HomeScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomeScreen(),
          transitionsBuilder: fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    SearchDogeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SearchDogeScreenRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SearchDogeScreen(activity: args.activity, key: args.key),
          transitionsBuilder: fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    ConfirmationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmationScreenRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ConfirmationScreen(activity: args.activity, key: args.key),
          transitionsBuilder: fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    ActivityListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ActivityListScreenRouteArgs>(
          orElse: () => const ActivityListScreenRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ActivityListScreen(key: args.key),
          transitionsBuilder: fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    ActivityDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ActivityDetailScreenRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              ActivityDetailScreen(activityId: args.activityId, key: args.key),
          fullscreenDialog: true);
    },
    AddCashScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AddCashScreen(), fullscreenDialog: true);
    },
    CashOutScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: CashOutScreen(), fullscreenDialog: true);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashScreenRoute.name, path: '/'),
        RouteConfig(WelcomeScreenRoute.name, path: '/welcome-screen'),
        RouteConfig(AuthScreenRoute.name, path: '/auth-screen'),
        RouteConfig(OnboardScreenRoute.name, path: '/onboard-screen'),
        RouteConfig(HomeScreenRoute.name, path: '/home-screen'),
        RouteConfig(SearchDogeScreenRoute.name, path: '/search-doge-screen'),
        RouteConfig(ConfirmationScreenRoute.name, path: '/confirmation-screen'),
        RouteConfig(ActivityListScreenRoute.name,
            path: '/activity-list-screen'),
        RouteConfig(ActivityDetailScreenRoute.name,
            path: '/activity-detail-screen'),
        RouteConfig(AddCashScreenRoute.name, path: '/add-cash-screen'),
        RouteConfig(CashOutScreenRoute.name, path: '/cash-out-screen')
      ];
}

/// generated route for
/// [SplashScreen]
class SplashScreenRoute extends PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [WelcomeScreen]
class WelcomeScreenRoute extends PageRouteInfo<void> {
  const WelcomeScreenRoute()
      : super(WelcomeScreenRoute.name, path: '/welcome-screen');

  static const String name = 'WelcomeScreenRoute';
}

/// generated route for
/// [AuthScreen]
class AuthScreenRoute extends PageRouteInfo<AuthScreenRouteArgs> {
  AuthScreenRoute({int? page, Key? key})
      : super(AuthScreenRoute.name,
            path: '/auth-screen',
            args: AuthScreenRouteArgs(page: page, key: key));

  static const String name = 'AuthScreenRoute';
}

class AuthScreenRouteArgs {
  const AuthScreenRouteArgs({this.page, this.key});

  final int? page;

  final Key? key;

  @override
  String toString() {
    return 'AuthScreenRouteArgs{page: $page, key: $key}';
  }
}

/// generated route for
/// [OnboardScreen]
class OnboardScreenRoute extends PageRouteInfo<OnboardScreenRouteArgs> {
  OnboardScreenRoute({Key? key, int initialPage = 0})
      : super(OnboardScreenRoute.name,
            path: '/onboard-screen',
            args: OnboardScreenRouteArgs(key: key, initialPage: initialPage));

  static const String name = 'OnboardScreenRoute';
}

class OnboardScreenRouteArgs {
  const OnboardScreenRouteArgs({this.key, this.initialPage = 0});

  final Key? key;

  final int initialPage;

  @override
  String toString() {
    return 'OnboardScreenRouteArgs{key: $key, initialPage: $initialPage}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute() : super(HomeScreenRoute.name, path: '/home-screen');

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [SearchDogeScreen]
class SearchDogeScreenRoute extends PageRouteInfo<SearchDogeScreenRouteArgs> {
  SearchDogeScreenRoute({required Activity_ActivityType activity, Key? key})
      : super(SearchDogeScreenRoute.name,
            path: '/search-doge-screen',
            args: SearchDogeScreenRouteArgs(activity: activity, key: key));

  static const String name = 'SearchDogeScreenRoute';
}

class SearchDogeScreenRouteArgs {
  const SearchDogeScreenRouteArgs({required this.activity, this.key});

  final Activity_ActivityType activity;

  final Key? key;

  @override
  String toString() {
    return 'SearchDogeScreenRouteArgs{activity: $activity, key: $key}';
  }
}

/// generated route for
/// [ConfirmationScreen]
class ConfirmationScreenRoute
    extends PageRouteInfo<ConfirmationScreenRouteArgs> {
  ConfirmationScreenRoute({required Activity activity, Key? key})
      : super(ConfirmationScreenRoute.name,
            path: '/confirmation-screen',
            args: ConfirmationScreenRouteArgs(activity: activity, key: key));

  static const String name = 'ConfirmationScreenRoute';
}

class ConfirmationScreenRouteArgs {
  const ConfirmationScreenRouteArgs({required this.activity, this.key});

  final Activity activity;

  final Key? key;

  @override
  String toString() {
    return 'ConfirmationScreenRouteArgs{activity: $activity, key: $key}';
  }
}

/// generated route for
/// [ActivityListScreen]
class ActivityListScreenRoute
    extends PageRouteInfo<ActivityListScreenRouteArgs> {
  ActivityListScreenRoute({Key? key})
      : super(ActivityListScreenRoute.name,
            path: '/activity-list-screen',
            args: ActivityListScreenRouteArgs(key: key));

  static const String name = 'ActivityListScreenRoute';
}

class ActivityListScreenRouteArgs {
  const ActivityListScreenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ActivityListScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ActivityDetailScreen]
class ActivityDetailScreenRoute
    extends PageRouteInfo<ActivityDetailScreenRouteArgs> {
  ActivityDetailScreenRoute({required int activityId, Key? key})
      : super(ActivityDetailScreenRoute.name,
            path: '/activity-detail-screen',
            args: ActivityDetailScreenRouteArgs(
                activityId: activityId, key: key));

  static const String name = 'ActivityDetailScreenRoute';
}

class ActivityDetailScreenRouteArgs {
  const ActivityDetailScreenRouteArgs({required this.activityId, this.key});

  final int activityId;

  final Key? key;

  @override
  String toString() {
    return 'ActivityDetailScreenRouteArgs{activityId: $activityId, key: $key}';
  }
}

/// generated route for
/// [AddCashScreen]
class AddCashScreenRoute extends PageRouteInfo<void> {
  const AddCashScreenRoute()
      : super(AddCashScreenRoute.name, path: '/add-cash-screen');

  static const String name = 'AddCashScreenRoute';
}

/// generated route for
/// [CashOutScreen]
class CashOutScreenRoute extends PageRouteInfo<void> {
  const CashOutScreenRoute()
      : super(CashOutScreenRoute.name, path: '/cash-out-screen');

  static const String name = 'CashOutScreenRoute';
}
