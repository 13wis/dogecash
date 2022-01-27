import 'package:flutter/material.dart';

class GradientMask extends ShaderMask {
  GradientMask({required Gradient gradient, Widget? child, Key? key})
      : super(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
            child: child,
            key: key);
}
