import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:frontend/constants/fractions.dart';
import 'package:frontend/constants/styles.dart';

// TODO: Use Matrix4 Transform instead of slide for these instances
class WelcomeMemojis extends StatefulWidget {
  final Size screen;
  final int memojiNumber;
  final AnimationController controller;

  const WelcomeMemojis(
      {required this.screen,
      required this.memojiNumber,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  _WelcomeMemojis createState() => _WelcomeMemojis();
}

const Map<int, double> radius = {
  0: 50.0,
  1: 25.0,
  2: 15.0,
  3: 40.0,
  4: 20.0,
  5: 15.0
};

class _WelcomeMemojis extends State<WelcomeMemojis>
    with SingleTickerProviderStateMixin {
  late final double _radius;
  late final bool _applyFilter;
  late final Animation<Offset> _firstOffset;
  late final Animation<Offset> _secondOffset;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    final int modulus3 = widget.memojiNumber % 3;
    final double begin = modulus3 == 0 ? 0.2 : 0.0;
    _radius = radius[widget.memojiNumber % 6]!;
    final List<Offset> positions = _getOffsetRelativeToScreen(widget.screen);
    _applyFilter = modulus3 != 0;
    _firstOffset = Tween<Offset>(begin: positions[0], end: positions[1])
        .animate(CurvedAnimation(
            parent: widget.controller,
            curve: Interval(begin, 0.8, curve: Curves.easeOut)));
    _secondOffset = Tween<Offset>(begin: Offset.zero, end: positions[2])
        .animate(CurvedAnimation(
            parent: widget.controller,
            curve: const Interval(0.8, 1.0, curve: Curves.easeInToLinear)));
    _fade = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: widget.controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeIn)));
  }

  /// Screen offsets are relative to the object's child, which in our case
  /// is the avatar. This function returns the offset values for the
  /// positions the memojis should move to based on screen size.
  List<Offset> _getOffsetRelativeToScreen(Size size) {
    final double height = size.height;
    final double width = size.width;
    final double avatarSize = _radius * 2;
    final List<List<double>> memoji = fractions[widget.memojiNumber]!;
    return List.generate(
        3,
        (index) => Offset(width * memoji[index][0] / avatarSize,
            height * memoji[index][1] / avatarSize));
  }

  @override
  Widget build(BuildContext context) {
    final Image image =
        Image.asset('assets/images/Avatar-${widget.memojiNumber + 1}.png');
    final Widget child = CircleAvatar(
        backgroundColor: DogeColors.memojiColor[widget.memojiNumber],
        radius: _radius,
        child: _applyFilter
            ? ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: image)
            : image);
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return SlideTransition(
              position: _firstOffset,
              child: SlideTransition(
                  position: _secondOffset,
                  child: FadeTransition(opacity: _fade, child: child)));
        },
        child: child);
  }
}
