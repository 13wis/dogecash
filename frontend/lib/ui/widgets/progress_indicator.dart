import 'package:flutter/material.dart';

class ModifiedProgressIndicator extends SizedBox {
  ModifiedProgressIndicator({Key? key, double? size, Color? color})
      : super(
            height: size ?? 20.0,
            width: size ?? 20.0,
            child: CircularProgressIndicator(
                color: color ?? Colors.black, strokeWidth: 3.0),
            key: key);
}
