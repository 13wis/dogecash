import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GlassmorphicCard extends StatefulWidget {
  final Size screen;
  final AnimationController controller;

  const GlassmorphicCard(
      {required this.screen, required this.controller, Key? key})
      : super(key: key);

  @override
  _GlassmorphicCardState createState() => _GlassmorphicCardState();
}

class _GlassmorphicCardState extends State<GlassmorphicCard> {
  late final double _width;
  late final Animation<double> _flyIn;

  @override
  void initState() {
    super.initState();

    _width = widget.screen.width;
    _flyIn =
        Tween<double>(begin: _width + (_width * 0.075), end: _width * 0.075)
            .animate(CurvedAnimation(
                parent: widget.controller,
                curve: const Interval(0.7, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    final double height = widget.screen.height;
    final double width = widget.screen.width;
    final Widget child = Container(
        width: width * 0.85,
        height: height * 0.25,
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 30.0),
        color: Colors.black.withAlpha(123),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    FaIcon(FontAwesomeIcons.ccVisa, size: 30.0),
                    FaIcon(FontAwesomeIcons.stripe, size: 30.0)
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          FaIcon(FontAwesomeIcons.signature),
                          Text('•••• 6969')
                        ]),
                    const Text('13/37')
                  ])
            ]));
    return Stack(children: [
      AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            return Positioned(
                top: height * 0.25, left: _flyIn.value, child: child!);
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: child)))
    ]);
  }
}
