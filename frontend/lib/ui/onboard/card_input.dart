import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/constants/styles.dart';

class CardInput extends StatelessWidget {
  final Function(CardFieldInputDetails?)? _onCardChanged;

  const CardInput(
      {required Function(CardFieldInputDetails?)? onCardChanged, Key? key})
      : _onCardChanged = onCardChanged,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: DogeColors.background),
        child: CardField(
            autofocus: true,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(GlobalSpacingFactor.three),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.circular(GlobalSpacingFactor.one)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius:
                        BorderRadius.circular(GlobalSpacingFactor.one))),
            // dangerouslyUpdateFullCardDetails: true,
            onCardChanged: _onCardChanged));
  }
}
