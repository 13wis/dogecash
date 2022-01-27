import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/activity/activity_bloc.dart';
import 'package:frontend/bloc/auth/auth_bloc.dart';
import 'package:frontend/bloc/balance/balance_bloc.dart';
import 'package:frontend/bloc/card/card_bloc.dart';
import 'package:frontend/bloc/external/external_bloc.dart';
import 'package:frontend/bloc/my_doges/my_doges_bloc.dart';
import 'package:frontend/constants/styles.dart' as styles;
import 'package:frontend/cubit/activity_detail/activity_detail_cubit.dart';
import 'package:frontend/cubit/confirmation/confirmation_cubit.dart';
import 'package:frontend/cubit/manage_external_account/manage_external_cubit.dart';
import 'package:frontend/cubit/register/register_cubit.dart';
import 'package:frontend/cubit/search/search_cubit.dart';
import 'package:frontend/cubit/signin/signin_cubit.dart';
import 'package:frontend/cubit/stripe_info/stripe_info_cubit.dart';
import 'package:frontend/cubit/update_dogetag/dogetag_cubit.dart';
import 'package:frontend/repos/activity_repository.dart';
import 'package:frontend/repos/address_repository.dart';
import 'package:frontend/repos/auth_repository.dart';
import 'package:frontend/repos/dogetag_repository.dart';
import 'package:frontend/repos/search_repository.dart';
import 'package:frontend/repos/transfer_repositiory.dart';
import 'package:frontend/repos/viewer_repository.dart';
import 'package:frontend/router/app_router.dart';
import 'package:frontend/util/init.dart';

void main() async {
  await initTasks();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

  runApp(DogeCash());
}

class DogeCash extends StatelessWidget {
  final AppRouter _appRouter;
  final _authenticationRepository = AuthenticationRepository();
  final _viewerRepository = ViewerRepository();
  final _dogetagRepository = DogetagRepository();
  final _addressRepository = AddressRepository();
  final _activityRepository = ActivityRepository();
  final _searchRepository = SearchRepository();
  final _transferRepository = TransferRepository();

  DogeCash({Key? key})
      : _appRouter = AppRouter(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => AuthenticationBloc(
                      authenticationRepository: _authenticationRepository,
                      viewerRepository: _viewerRepository)
                    ..add(const GetInitialAuthenticationStatus())),
              BlocProvider(
                  create: (_) => SignInCubit(
                      authenticationRepository: _authenticationRepository)),
              BlocProvider(
                  create: (_) => RegisterCubit(
                      authenticationRepository: _authenticationRepository)),
              BlocProvider(
                  create: (_) => UpdateDogetagCubit(
                      dogetagRepository: _dogetagRepository,
                      viewerRepository: _viewerRepository)),
              BlocProvider(
                  create: (_) => UpdateStripeInfoCubit(
                      addressRepository: _addressRepository,
                      viewerRepository: _viewerRepository)),
              BlocProvider(
                  create: (_) =>
                      ManageExternalCubit(viewerRepository: _viewerRepository)),
              BlocProvider(
                  create: (_) =>
                      BalanceBloc(viewerRepository: _viewerRepository)),
              BlocProvider(
                  create: (_) => CardBloc(viewerRepository: _viewerRepository)),
              BlocProvider(
                  create: (_) =>
                      ExternalBloc(viewerRepository: _viewerRepository)),
              BlocProvider(
                  create: (_) =>
                      ActivityBloc(activityRepository: _activityRepository)),
              BlocProvider(
                  create: (_) =>
                      MyDogesBloc(viewerRepository: _viewerRepository)),
              BlocProvider(
                  create: (_) =>
                      SearchCubit(searchRepository: _searchRepository)),
              BlocProvider(
                  create: (_) => ConfirmationCubit(
                      transferRepository: _transferRepository)),
              BlocProvider(
                  create: (_) => ActivityDetailCubit(
                      activityRepository: _activityRepository))
            ],
            child: MaterialApp.router(
                theme: styles.theme,
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.dark,
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.delegate())));
  }
}
