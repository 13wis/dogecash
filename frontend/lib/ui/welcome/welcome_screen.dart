import 'package:flutter/material.dart';
import 'package:frontend/ui/welcome/glassmorphic_card.dart';
import 'package:frontend/ui/welcome/welcome_content.dart';
import 'package:frontend/ui/welcome/welcome_memojis.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final List<WelcomeMemojis> memojis = List<WelcomeMemojis>.generate(
        11,
        (index) => WelcomeMemojis(
            screen: screen, memojiNumber: index, controller: _controller));
    final GlassmorphicCard card =
        GlassmorphicCard(screen: screen, controller: _controller);
    // This allows me to use the staggered animation package without sending
    // a controller to the widget to control when it shows up. Ultimately,
    // the efficiency of this may need to be explored.
    final Widget content = FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 3600)),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? WelcomeContent(width: screen.width)
                : Container());
    return Scaffold(body: Stack(children: [...memojis, card, content]));
  }
}
