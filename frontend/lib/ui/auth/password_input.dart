import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/ui/widgets/fade_slide.dart';

class PasswordInput extends TextField {
  static const BorderRadius _borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0));
  PasswordInput(
      {required Function(String?) onChanged,
      required VoidCallback onIconTapped,
      required bool isPasswordVisible,
      Key? key})
      : super(
            autocorrect: false,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(GlobalSpacingFactor.three),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: _borderRadius),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: _borderRadius),
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
                suffixIcon: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: onIconTapped,
                    child: FadeSlideSwitcher(
                        Container(
                            key: ValueKey<bool>(isPasswordVisible),
                            padding: const EdgeInsets.symmetric(
                                horizontal: GlobalSpacingFactor.two),
                            height: 24.0,
                            width: 64.0,
                            child: FaIcon(
                                isPasswordVisible
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                color: Colors.white,
                                size: 24.0)),
                        vertical: false)),
                hintText: 'Password'),
            obscureText: !isPasswordVisible,
            onChanged: onChanged,
            key: key);
}
