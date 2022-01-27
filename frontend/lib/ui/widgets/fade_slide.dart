import 'package:flutter/material.dart';

class FadeSlideSwitcher extends AnimatedSwitcher {
  FadeSlideSwitcher(Widget? child,
      {Key? key,
      Curve? curve,
      Tween<Offset>? offsetTween,
      bool vertical = true})
      : super(
            duration: const Duration(milliseconds: 300),
            switchInCurve:
                curve ?? const Interval(0.5, 1.0, curve: Curves.ease),
            switchOutCurve: Interval(0.5, 1.0, curve: Curves.ease.flipped),
            reverseDuration: const Duration(milliseconds: 300),
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                children: <Widget>[
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
                alignment: Alignment.topLeft,
              );
            },
            transitionBuilder: (child, animation) {
              final double dx = vertical ? 0.0 : 0.125;
              final double dy = vertical ? 0.125 : 0.0;
              return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                      position: offsetTween != null
                          ? offsetTween.animate(animation)
                          : Tween<Offset>(
                                  begin: Offset(dx, dy), end: Offset.zero)
                              .animate(animation),
                      child: child));
            },
            child: child,
            key: key);
}
