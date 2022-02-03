part of 'home_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  final Activity activity;

  const ConfirmationScreen({required this.activity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ConfirmationCubit>().reset();
    context.read<BalanceBloc>().add(const GetBalance());
    context.read<ActivityBloc>().add(const GetActivity(null));
    final currency = intl.NumberFormat.simpleCurrency(locale: "en-US");
    const Map<int, LinearGradient> gradientMap = {
      0: LinearGradient(colors: [Colors.lightGreen, Colors.lightBlue]),
      1: LinearGradient(colors: [Colors.purple, Colors.blue]),
      2: LinearGradient(colors: [Colors.pink, Colors.red]),
      3: LinearGradient(colors: [Colors.lightBlue, Colors.lightGreen]),
      4: LinearGradient(colors: [Colors.blue, Colors.purple]),
      5: LinearGradient(colors: [Colors.red, Colors.pink]),
    };
    final shader = gradientMap[activity.id.toInt() % 6]!
        .createShader(const Rect.fromLTWH(0.0, 0.0, 150.0, 200.0));
    final style = Theme.of(context).textTheme.headline4;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: DogeColors.background,
          leading: GestureDetector(
              onTap: () =>
                  AutoRouter.of(context).replaceAll([const HomeScreenRoute()]),
              child: Align(
                  alignment: Alignment.center,
                  child: Text('×',
                      style: style!.copyWith(fontWeight: FontWeight.normal)))),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(GlobalSpacingFactor.four),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 500),
                    childAnimationBuilder: (child) {
                      return SlideAnimation(
                          verticalOffset: -20.0,
                          child: FadeInAnimation(child: child));
                    },
                    children: [
                      if (activity.peer.profilePicUrl.isNotEmpty)
                        ClipRRect(
                            borderRadius:
                                BorderRadius.circular(GlobalSpacingFactor.one),
                            child: Image.network(activity.peer.profilePicUrl,
                                height: 75.0,
                                width: 75.0, frameBuilder: (context, child,
                                    frame, wasSynchronouslyLoaded) {
                              if (wasSynchronouslyLoaded) {
                                return child;
                              }
                              return Shimmer.fromColors(
                                  child: const SizedBox.expand(),
                                  baseColor: Colors.green,
                                  highlightColor: Colors.green.shade50);
                            }))
                      else if (activity.peer.firstName.isNotEmpty)
                        Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                    GlobalSpacingFactor.one)),
                            alignment: Alignment.center,
                            child: Text(
                                activity.peer.firstName.characters.first,
                                style: const TextStyle(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold))),
                      const SizedBox(height: GlobalSpacingFactor.four),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: '🎉 You ', style: style),
                        TextSpan(
                            text: activity.activityType ==
                                    Activity_ActivityType.pay
                                ? 'paid '
                                : 'requested ',
                            style: style),
                        TextSpan(
                            text:
                                currency.format(activity.amount.toInt() / 100),
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: style.fontSize,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = shader)),
                        TextSpan(
                            text: activity.activityType ==
                                    Activity_ActivityType.pay
                                ? ' to '
                                : ' from ',
                            style: style),
                        TextSpan(
                            text: activity.peer.dogetag,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: style.fontSize,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()..shader = shader))
                      ])),
                      const SizedBox(height: GlobalSpacingFactor.four * 2),
                      DogeButton('awesome!',
                          width: 200.0,
                          borderRadius: BorderRadius.circular(30.0),
                          onPressed: () => AutoRouter.of(context)
                              .replaceAll([const HomeScreenRoute()])),
                      // Force the components to center a little further up top
                      const SizedBox(height: GlobalSpacingFactor.four * 8)
                    ]))));
  }
}
