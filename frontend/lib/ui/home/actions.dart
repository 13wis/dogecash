part of 'home_screen.dart';

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double strokeWidth = 3.0;
    return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: GlobalSpacingFactor.two),
        scrollDirection: Axis.horizontal,
        child: CustomPaint(
            painter: GradientPainter(
                strokeWidth: 3.0,
                gradient: const LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.blueAccent,
                  Colors.greenAccent
                ]),
                radius: GlobalSpacingFactor.two),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(
                      strokeWidth, strokeWidth, 0.0, strokeWidth),
                  child: InkWell(
                      onTap: () => AutoRouter.of(context).push(
                          SearchDogeScreenRoute(
                              activity: Activity_ActivityType.pay)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: GlobalSpacingFactor.two,
                              horizontal: GlobalSpacingFactor.three * 2),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                FaIcon(FontAwesomeIcons.solidCaretSquareUp,
                                    size: 24.0),
                                SizedBox(height: GlobalSpacingFactor.one),
                                Text('pay')
                              ])))),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: strokeWidth),
                  child: InkWell(
                      onTap: () => AutoRouter.of(context).push(
                          SearchDogeScreenRoute(
                              activity: Activity_ActivityType.pay)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: GlobalSpacingFactor.two,
                              horizontal: GlobalSpacingFactor.three * 2),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                FaIcon(FontAwesomeIcons.solidPlusSquare,
                                    size: 24.0),
                                SizedBox(height: GlobalSpacingFactor.one),
                                Text('add cash')
                              ])))),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: strokeWidth),
                  child: InkWell(
                      onTap: () => AutoRouter.of(context).push(
                          SearchDogeScreenRoute(
                              activity: Activity_ActivityType.request)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: GlobalSpacingFactor.two,
                              horizontal: GlobalSpacingFactor.three * 2),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                FaIcon(FontAwesomeIcons.solidCaretSquareDown,
                                    size: 24.0),
                                SizedBox(height: GlobalSpacingFactor.one),
                                Text('request')
                              ])))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0.0, strokeWidth, strokeWidth, strokeWidth),
                  child: InkWell(
                      onTap: () => AutoRouter.of(context).push(
                          SearchDogeScreenRoute(
                              activity: Activity_ActivityType.pay)),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: GlobalSpacingFactor.two,
                              horizontal: GlobalSpacingFactor.three * 2),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                FaIcon(FontAwesomeIcons.solidMinusSquare,
                                    size: 24.0),
                                SizedBox(height: GlobalSpacingFactor.one),
                                Text('cash out')
                              ]))))
            ])));
  }
}
