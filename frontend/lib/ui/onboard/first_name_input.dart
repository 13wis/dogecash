import 'package:flutter/material.dart';
import 'package:frontend/constants/styles.dart';

class FirstNameInput extends TextField {
  static const BorderRadius _borderRadius =
      BorderRadius.only(topLeft: Radius.circular(8.0));
  FirstNameInput(
      {required Function(String?) onChanged, required bool valid, Key? key})
      : super(
            autocorrect: false,
            autofocus: true,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(GlobalSpacingFactor.three),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: _borderRadius),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: valid ? Colors.blue : Colors.red),
                    borderRadius: _borderRadius),
                hintText: 'First Name'),
            keyboardType: TextInputType.name,
            onChanged: onChanged,
            key: key);
}
