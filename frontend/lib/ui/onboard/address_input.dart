import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/cubit/stripe_info/stripe_info_cubit.dart';
import 'package:provider/src/provider.dart';

class AddressInput extends StatefulWidget {
  final Function(String?) onChanged;
  final bool valid;
  final List<String> predictions;

  const AddressInput(
      {required this.onChanged,
      required this.valid,
      required this.predictions,
      Key? key})
      : super(key: key);

  @override
  _AddressInputState createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  static const _borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0));

  final FocusNode _focus = FocusNode();
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _controller = TextEditingController();
  late OverlayEntry? overlay;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      if (_focus.hasFocus) {
        overlay = _showPredictionsOverlay();
        Overlay.of(context)?.insert(overlay!);
      } else {
        if (overlay != null) {
          overlay!.remove();
          overlay = null;
        }
      }
    });
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (overlay != null) {
        overlay!.remove();
        overlay = _showPredictionsOverlay();
        Overlay.of(context)?.insert(overlay!);
      }
    });
  }

  OverlayEntry _showPredictionsOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    return OverlayEntry(builder: (context) {
      final Widget child = _controller.text.isNotEmpty &&
              widget.predictions.isNotEmpty
          ? Container(
              constraints: const BoxConstraints(maxHeight: 180.0),
              color: Colors.black.withAlpha(123),
              width: size.width,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: widget.predictions.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final String prediction = widget.predictions[index];
                        return Padding(
                            padding:
                                const EdgeInsets.all(GlobalSpacingFactor.two),
                            child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  context
                                      .read<UpdateStripeInfoCubit>()
                                      .addressChanged(prediction);
                                  _controller.text = prediction;
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                child: Text(prediction,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1)));
                      })))
          : Container();
      return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + GlobalSpacingFactor.one),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(GlobalSpacingFactor.one),
                      bottomRight: Radius.circular(GlobalSpacingFactor.one)),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                      child: child))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
        link: _layerLink,
        child: TextField(
            autocorrect: false,
            controller: _controller,
            focusNode: _focus,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.all(GlobalSpacingFactor.three),
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none, borderRadius: _borderRadius),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: widget.valid ? Colors.blue : Colors.red),
                    borderRadius: _borderRadius),
                hintText: 'Full address'),
            keyboardType: TextInputType.name,
            onChanged: widget.onChanged));
  }
}
