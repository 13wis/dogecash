import 'package:flutter/material.dart';
import 'package:frontend/constants/styles.dart';

class LastNameInput extends TextField {
  static const _borderRadius =
      BorderRadius.only(topRight: Radius.circular(8.0));
  LastNameInput(
      {required Function(String?) onChanged, required bool valid, Key? key})
      : super(
            autocorrect: false,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(GlobalSpacingFactor.three),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: _borderRadius),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: valid ? Colors.blue : Colors.red),
                    borderRadius: _borderRadius),
                hintText: 'Last Name'),
            keyboardType: TextInputType.name,
            onChanged: onChanged,
            key: key);
}
