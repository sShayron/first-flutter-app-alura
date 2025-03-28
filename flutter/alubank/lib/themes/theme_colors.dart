import 'package:flutter/material.dart';

class ThemeColors {
  static const MaterialColor primaryColor = Colors.purple;
  static const List<Color> headerGradient = [
    Color.fromRGBO(103, 99, 234, 1.0),
    Color.fromRGBO(155, 105, 254, 1.0),
    Color.fromRGBO(195, 107, 255, 1.0)
  ];
  static const recentActivity = {
    'spent': Color.fromRGBO(255, 175, 20, 1),
    'income': Color.fromRGBO(191, 69, 198, 1),
    'free_delivery': Color.fromRGBO(255, 0, 112, 1),
    'streaming': Color.fromRGBO(75, 89, 191, 1)
  };
  static const division = Color.fromRGBO(166, 166, 166, 1);
  static const goals = {
    'free_delivery': Color.fromRGBO(255, 0, 112, 1),
    'streaming': Color.fromRGBO(75, 89, 191, 1)
  };
}
