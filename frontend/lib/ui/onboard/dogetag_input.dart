import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/update_dogetag/dogetag_cubit.dart';

class DogetagInput extends TextField {
  DogetagInput(
      {required Function(String?) onChanged,
      required UpdateDogetagState state,
      Key? key})
      : super(
            autocorrect: false,
            autofocus: true,
            onChanged: onChanged,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(GlobalSpacingFactor.three),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                hintText: '\$J.G.Wentworth',
                errorText: state.isUnavailable ? 'This dogetag is taken' : null,
                suffix: state.isLoading
                    ? const CircularProgressIndicator()
                    : state.isAvailable
                        ? const FaIcon(FontAwesomeIcons.checkCircle, size: 18.0)
                        : const SizedBox(height: 18.0)),
            key: key);
}
