import 'package:flutter/material.dart';
import 'package:frontend/constants/styles.dart';

class EmailInput extends TextField {
  static const _borderRadius = BorderRadius.only(
      topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0));
  const EmailInput({required Function(String?) onChanged, Key? key})
      : super(
            autocorrect: false,
            decoration: const InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.all(GlobalSpacingFactor.three),
                border: OutlineInputBorder(borderRadius: _borderRadius),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: _borderRadius),
                hintText: 'Email address'),
            keyboardType: TextInputType.emailAddress,
            onChanged: onChanged,
            key: key);
}
