part of 'home_screen.dart';

class ActivityDetailScreen
    extends BlocBuilder<ActivityDetailCubit, ActivityDetailState> {
  final int activityId;

  ActivityDetailScreen({required this.activityId, Key? key})
      : super(
            builder: (context, state) {
              if (!state.loading && state.activity == null) {
                context
                    .read<ActivityDetailCubit>()
                    .getByActivityId(id: activityId);
              }
              final activity = state.activity;
              final currency =
                  intl.NumberFormat.simpleCurrency(locale: "en-US");
              const Map<int, LinearGradient> gradientMap = {
                0: LinearGradient(
                    colors: [Colors.lightGreen, Colors.lightBlue]),
                1: LinearGradient(colors: [Colors.purple, Colors.blue]),
                2: LinearGradient(colors: [Colors.pink, Colors.red]),
                3: LinearGradient(
                    colors: [Colors.lightBlue, Colors.lightGreen]),
                4: LinearGradient(colors: [Colors.blue, Colors.purple]),
                5: LinearGradient(colors: [Colors.red, Colors.pink]),
              };
              final style = Theme.of(context).textTheme.headline4;
              final shader = gradientMap[activityId % 6]!
                  .createShader(const Rect.fromLTWH(0.0, 0.0, 150.0, 200.0));
              final date = intl.DateFormat.yMMMd().add_jm();
              return state.loading
                  ? Center(child: ModifiedProgressIndicator())
                  : activity != null
                      ? Scaffold(
                          appBar: AppBar(
                              elevation: 0.0,
                              backgroundColor: DogeColors.background),
                          body: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  GlobalSpacingFactor.four,
                                  GlobalSpacingFactor.four,
                                  GlobalSpacingFactor.four,
                                  GlobalSpacingFactor.four * 2),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (activity.peer.profilePicUrl.isNotEmpty)
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              GlobalSpacingFactor.one),
                                          child: Image.network(
                                              activity.peer.profilePicUrl,
                                              height: 75.0,
                                              width: 75.0, frameBuilder:
                                                  (context, child, frame,
                                                      wasSynchronouslyLoaded) {
                                            if (wasSynchronouslyLoaded) {
                                              return child;
                                            }
                                            return Shimmer.fromColors(
                                                child: const SizedBox.expand(),
                                                baseColor: Colors.green,
                                                highlightColor:
                                                    Colors.green.shade50);
                                          }))
                                    else if (activity.peer.firstName.isNotEmpty)
                                      Container(
                                          width: 75.0,
                                          height: 75.0,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      GlobalSpacingFactor.one)),
                                          alignment: Alignment.center,
                                          child: Text(
                                              activity.peer.firstName.characters
                                                  .first,
                                              style: const TextStyle(
                                                  fontSize: 36.0,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    activity.activityType ==
                                                Activity_ActivityType.pay ||
                                            activity.activityType ==
                                                Activity_ActivityType.request
                                        ? RichText(
                                            text: TextSpan(children: [
                                            TextSpan(
                                                text: 'You ', style: style),
                                            TextSpan(
                                                text: activity.activityType ==
                                                        Activity_ActivityType
                                                            .pay
                                                    ? 'paid '
                                                    : 'requested ',
                                                style: style),
                                            TextSpan(
                                                text: currency.format(
                                                    activity.amount.toInt() /
                                                        100),
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: style!.fontSize,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..shader = shader)),
                                            TextSpan(
                                                text: activity.activityType ==
                                                        Activity_ActivityType
                                                            .pay
                                                    ? ' to '
                                                    : ' from ',
                                                style: style),
                                            TextSpan(
                                                text: activity.peer.dogetag,
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: style.fontSize,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..shader = shader))
                                          ]))
                                        : RichText(
                                            text: TextSpan(children: [
                                            TextSpan(
                                                text: activity.activityType ==
                                                        Activity_ActivityType
                                                            .cash_out
                                                    ? 'You cashed out '
                                                    : 'You added ',
                                                style: style),
                                            TextSpan(
                                                text: currency.format(
                                                    activity.amount.toInt() /
                                                        100),
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontSize: style!.fontSize,
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..shader = shader))
                                          ])),
                                    Column(children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'on ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5),
                                        TextSpan(
                                            text: date.format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    activity.created.toInt() *
                                                        1000)),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.normal))
                                      ])),
                                      if (activity.externalAccount.last4
                                          .isNotEmpty) ...[
                                        const Divider(),
                                        Text(
                                            activity.externalAccount.brand
                                                    .isNotEmpty
                                                ? '${activity.externalAccount.brand} card ending in ${activity.externalAccount.last4}'
                                                : activity.externalAccount
                                                        .bankName.isNotEmpty
                                                    ? activity.externalAccount
                                                        .bankName
                                                    : 'unkown',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.normal))
                                      ],
                                    ])
                                    // Force the components to center a little
                                  ])))
                      : const Center(child: Text('could not find activity'));
            },
            key: key);
}
