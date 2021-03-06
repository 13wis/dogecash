import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/bloc/activity/activity_bloc.dart';
import 'package:frontend/bloc/auth/auth_bloc.dart';
import 'package:frontend/bloc/balance/balance_bloc.dart';
import 'package:frontend/bloc/card/card_bloc.dart';
import 'package:frontend/bloc/external/external_bloc.dart';
import 'package:frontend/bloc/my_doges/my_doges_bloc.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/activity_detail/activity_detail_cubit.dart';
import 'package:frontend/cubit/confirmation/confirmation_cubit.dart';
import 'package:frontend/cubit/search/search_cubit.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:frontend/router/app_router.dart';
import 'package:frontend/ui/widgets/activity_line.dart';
import 'package:frontend/ui/widgets/doge_button.dart';
import 'package:frontend/ui/widgets/doge_line_item.dart';
import 'package:frontend/ui/widgets/fade_slide.dart';
import 'package:frontend/ui/widgets/gradient_mask.dart';
import 'package:frontend/ui/widgets/gradient_paint.dart';
import 'package:frontend/ui/widgets/progress_indicator.dart';
import 'package:frontend/ui/widgets/scale_on_tap.dart';
import 'package:intl/intl.dart' as intl;
import 'package:protobuf/protobuf.dart';
import 'package:shimmer/shimmer.dart';

part 'actions.dart';
part 'activity_detail.dart';
part 'activity_list.dart';
part 'add_cash.dart';
part 'amount.dart';
part 'balance_card.dart';
part 'bottom_sheet.dart';
part 'cash_out.dart';
part 'external.dart';
part 'home_bar.dart';
part 'profile.dart';
part 'search_doge.dart';
part 'confirmation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _page;
  late AssetImage image1;
  late AssetImage image2;

  @override
  void initState() {
    super.initState();
    _page = 0;
    image1 = const AssetImage('assets/images/mesh-gradient-1.png');
    image2 = const AssetImage('assets/images/mesh-gradient-2.png');
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1, context);
    precacheImage(image2, context);
    super.didChangeDependencies();
  }

  Widget loadingWrapper(Widget child) {
    return BlocBuilder<BalanceBloc, BalanceState>(builder: (context, b) {
      return BlocBuilder<ExternalBloc, ExternalState>(builder: (context, e) {
        return BlocBuilder<MyDogesBloc, MyDogesState>(builder: (context, m) {
          return BlocBuilder<ActivityBloc, ActivityState>(
              builder: (context, a) {
            return b.loading || e.loading || m.loading || a.loading
                ? Center(
                    child: ModifiedProgressIndicator(
                        size: 30.0, color: Colors.green))
                : child;
          });
        });
      });
    });
  }

  void togglePage() => setState(() => _page = 1 >> _page);

  @override
  Widget build(BuildContext context) {
    void showAddCashSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) => AnimatedPadding(
              padding: MediaQuery.of(context)
                  .viewInsets
                  .add(const EdgeInsets.all(GlobalSpacingFactor.four)),
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: SizedBox(
                  height: 300,
                  child: Column(children: [
                    const SizedBox(height: GlobalSpacingFactor.four),
                    Text('add cash',
                        style: Theme.of(context).textTheme.headline5),
                    const SizedBox(height: GlobalSpacingFactor.two),
                    const TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.all(GlobalSpacingFactor.four))),
                    const SizedBox(height: GlobalSpacingFactor.four),
                    DogeButton('add cash')
                  ]))));
    }

    final List<Widget> cards = [BalanceCard(), External()];
    final Size size = MediaQuery.of(context).size;
    final Map<int, Widget> pages = {
      0: Scaffold(
          appBar: HomeAppBar(onTap: togglePage),
          body: Stack(children: [
            ConstrainedBox(
                constraints: BoxConstraints(maxHeight: size.height / 3),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: size.width * 2 / 3,
                          margin: EdgeInsets.fromLTRB(
                              index == 0
                                  ? GlobalSpacingFactor.two
                                  : GlobalSpacingFactor.one,
                              GlobalSpacingFactor.two,
                              index == cards.length - 1
                                  ? GlobalSpacingFactor.two
                                  : GlobalSpacingFactor.one,
                              GlobalSpacingFactor.two),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: index == 0 ? image1 : image2,
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(
                                  GlobalSpacingFactor.three)),
                          child: Padding(
                              padding: const EdgeInsets.all(
                                  GlobalSpacingFactor.four),
                              child: cards[index]));
                    })),
            BottomSheet()
          ])),
      1: ProfileScreen(onTap: togglePage)
    };

    return loadingWrapper(PageTransitionSwitcher(
        transitionBuilder: (child, animation, secondaryAnimation) =>
            SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                fillColor: DogeColors.background,
                child: child),
        child: pages[_page]));
  }
}
