import 'package:flutter/cupertino.dart';

class ScaleOnTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? end;

  const ScaleOnTap({Key? key, required this.child, this.onTap, this.end})
      : super(key: key);

  @override
  _ScaleOnTapState createState() => _ScaleOnTapState();
}

class _ScaleOnTapState extends State<ScaleOnTap>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late bool completed = false;
  late bool notReversed = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    final CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOut);

    animation =
        Tween(begin: 1.0, end: widget.end ?? 1.5).animate(curvedAnimation)
          // If the animation is complete, allow the animation to reverse when
          // tap is released, otherwise wait for the tap to release and
          // activate the reverse animation
          ..addListener(() {
            setState(() {
              completed = animation.isCompleted;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (notReversed) {
                controller.reverse();
                setState(() {
                  notReversed = false;
                });
              }
            }
          });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTap,
        onTapDown: (tapDownDetails) => controller.forward(),
        onTapUp: (tapUpDetails) {
          if (completed) {
            controller.reverse();
          } else {
            setState(() {
              notReversed = true;
            });
          }
        },
        child: Transform.scale(
            scale: animation.value.toDouble(), child: widget.child));
  }
}
