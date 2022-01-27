import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/router/app_router.dart';
import 'package:frontend/ui/widgets/doge_button.dart';

class WelcomeContent extends StatelessWidget {
  final double width;

  const WelcomeContent({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Text('All your favorite hoomans in one place',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5),
      const SizedBox(height: GlobalSpacingFactor.two),
      const Text('Securely and effortlessly send money to anyone in the world',
          textAlign: TextAlign.center),
      const SizedBox(height: GlobalSpacingFactor.four),
      DogeButton('get started',
          width: width * 0.5,
          textColor: Colors.white,
          gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blue, Colors.green]),
          strokeWidth: 3.0,
          onPressed: () => AutoRouter.of(context).replace(AuthScreenRoute()))
    ];
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width * 0.075, vertical: 150.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (child) {
                  return SlideAnimation(
                      verticalOffset: -20.0,
                      child: FadeInAnimation(child: child));
                },
                children: children)));
  }
}
