import 'package:flutter/material.dart';
import 'package:frontend/constants/styles.dart';
import 'package:frontend/proto/dogecash.pbgrpc.dart';
import 'package:shimmer/shimmer.dart';

class DogeLineItem extends StatelessWidget {
  final String by;
  final BaseDoge doge;
  final bool dark;

  const DogeLineItem(
      {required this.by, required this.doge, this.dark = true, Key? key})
      : super(key: key);

  List<Widget> _buildTextLines() {
    RichText buildWord(String text) {
      return RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              children:
                  List<TextSpan>.generate(text.characters.length, (index) {
            final String character = text.characters.toList()[index];
            // if this particular character matches a character the
            // doge was searching for, make it bold
            final Characters byCharacters = by.toLowerCase().characters;
            final bool hasCharacterMatch =
                byCharacters.contains(character.toLowerCase());
            final TextStyle determineTextStyle = TextStyle(
                fontFamily: 'Avenir',
                color: dark ? Colors.white : Colors.black,
                fontSize: 18.0,
                fontWeight: hasCharacterMatch ? FontWeight.bold : null);

            return TextSpan(text: character, style: determineTextStyle);
          })));
    }

    // Destructuring assignments anyone? What about tuples? No?... ok...
    final String? firstName = doge.firstName;
    final String? lastName = doge.lastName;
    final String? dogetag = doge.dogetag;
    final String? email = doge.email;

    // We SHOULD expect a doge to be null in the following order: Email ->
    // Dogetag -> First & Last Name as that is the order you onboard with.
    // Any doge returned not fitting this would show as 'null'
    if (firstName == null && lastName == null && dogetag == null) {
      return [buildWord(email!)];
    }

    if (firstName == null && lastName == null) {
      return [buildWord(dogetag!), buildWord(email!)];
    }

    return [buildWord('$firstName $lastName'), buildWord('$dogetag')];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: dark ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(GlobalSpacingFactor.one)),
        padding: const EdgeInsets.all(GlobalSpacingFactor.two),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              height: 50.0,
              width: 50.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(GlobalSpacingFactor.one),
                  child: doge.profilePicUrl.isNotEmpty
                      ? Image.network(doge.profilePicUrl, frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) {
                            return child;
                          }
                          return Shimmer.fromColors(
                              child: const SizedBox.expand(),
                              baseColor: Colors.green,
                              highlightColor: Colors.green.shade50);
                        })
                      : Container(
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: Text(
                              doge.firstName.isNotEmpty
                                  ? doge.firstName.characters.first
                                  : '?',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))))),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: GlobalSpacingFactor.two),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildTextLines())))
        ]));
  }
}
