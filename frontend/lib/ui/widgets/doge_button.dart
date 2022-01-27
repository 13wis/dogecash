import 'package:flutter/material.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/ui/widgets/fade_slide.dart';

class DogeButton extends StatelessWidget {
  final String _text;
  final VoidCallback? _onPressed;
  final double _width;
  final Color _textColor;
  final Widget? _child;
  final Decoration _dectoration;
  final double? _strokeWidth;

  static const double height = 60.0;

  DogeButton(String text,
      {Key? key,
      VoidCallback? onPressed,
      double? width,
      Color? backgroundColor,
      Gradient? gradient,
      BorderRadius? borderRadius,
      Color? textColor,
      double? strokeWidth,
      Widget? child})
      : _text = text,
        _onPressed = onPressed,
        _width = width ?? double.infinity,
        _textColor = textColor ?? DogeColors.whiteButtonText,
        _strokeWidth = strokeWidth,
        _child = child,
        _dectoration = BoxDecoration(
            color: backgroundColor == null && gradient == null
                ? onPressed == null
                    ? Colors.grey
                    : Colors.white
                : backgroundColor,
            gradient: gradient,
            borderRadius: borderRadius ?? BorderRadius.circular(8.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget child = FadeSlideSwitcher(Container(
        key: ValueKey<String>(_child.toString()),
        alignment: Alignment.center,
        width: _width,
        height: height,
        child: _child ??
            Text(_text,
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: _textColor))));
    return TextButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          _onPressed != null ? _onPressed!() : {};
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.center,
            decoration: _dectoration,
            width: _width,
            height: height,
            child: _strokeWidth != null
                ? Container(
                    alignment: Alignment.center,
                    height: height - _strokeWidth!,
                    width: _width - _strokeWidth!,
                    decoration: BoxDecoration(
                        color: DogeColors.background,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: child)
                : child));
  }
}
