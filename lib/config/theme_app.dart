import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFFFFFFF);

final List<Color> _colorList = [
  Colors.yellow,
  Colors.green,
  Colors.cyan,
  Colors.amber,
  Colors.teal,
  Colors.pink,
  Colors.purple,
  _customColor
];

class AppTheme {
  final int colorSelector;
  AppTheme({required this.colorSelector})
      : assert(colorSelector < _colorList.length && colorSelector >= 0,
            'The color selector must be less than ${_colorList.length}');

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _colorList[colorSelector],
      ),
    );
  }
}
