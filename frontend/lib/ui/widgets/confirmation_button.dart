import 'package:flutter/material.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/ui/widgets/doge_button.dart';

class ConfirmationButton extends StatefulWidget {
  final String text;
  final bool enabled;
  final double width;
  final VoidCallback onHoldComplete;

  const ConfirmationButton(
      {Key? key,
      required this.text,
      required this.enabled,
      required this.width,
      required this.onHoldComplete})
      : super(key: key);

  @override
  ConfirmationButtonState createState() => ConfirmationButtonState();
}

class ConfirmationButtonState extends State<ConfirmationButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(milliseconds: 500));

    final CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: controller, curve: Curves.easeIn, reverseCurve: Curves.easeOut);

    animation = Tween(begin: 0.0, end: widget.width).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) widget.onHoldComplete();
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (tapDownDetails) {
          if (widget.enabled) controller.forward();
        },
        onTapUp: (tapUpDetails) => controller.reverse(),
        child: Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: widget.enabled ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(GlobalSpacingFactor.one)),
            child: Stack(children: [
              Container(
                  height: 60.0,
                  width: animation.value,
                  decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(GlobalSpacingFactor.one),
                          bottomLeft:
                              Radius.circular(GlobalSpacingFactor.one)))),
              DogeButton(widget.text,
                  backgroundColor: Colors.transparent, textColor: Colors.white)
            ])));
  }
}
