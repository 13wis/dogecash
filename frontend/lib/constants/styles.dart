import 'package:flutter/material.dart';

class DogeColors {
  static const Color background = Color(0xFF121212);
  static const Color whiteButtonText = Color(0xFF121212);
  static const Map<int, Color> memojiColor = {
    0: Colors.red,
    1: Colors.orange,
    2: Colors.yellow,
    3: Colors.green,
    4: Colors.blue,
    5: Colors.purple,
    6: Colors.pink,
    7: Colors.deepOrange,
    8: Colors.grey,
    9: Colors.white,
    10: Colors.indigo,
    11: Colors.teal
  };
}

final ThemeData theme = ThemeData(
    backgroundColor: DogeColors.background,
    scaffoldBackgroundColor: DogeColors.background,
    canvasColor: DogeColors.background,
    brightness: Brightness.dark,
    fontFamily: 'Avenir',
    primaryColor: Colors.green,
    textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 18.0),
        button: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontWeight: FontWeight.bold),
        headline4:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white)));

class GlobalSpacingFactor {
  static const double one = 8.0;
  static const double two = 16.0;
  static const double three = 24.0;
  static const double four = 32.0;
  static const double six = 48.0;
}
