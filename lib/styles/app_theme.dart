import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData loadTheme() {
    return ThemeData(
      primaryColor: Colors.white,
      textTheme: _textTheme,
      fontFamily: 'GoogleSans',
      shadowColor: Colors.black12,
      dividerColor: Color(0xFFDADCE0),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
      headline6: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      subtitle1: TextStyle(fontSize: 14),
      subtitle2: TextStyle(fontSize: 12),
    );
  }

  static List<Color> get themeColors => [
        Color(0xFF90D1DA),
        Color(0xFF568E9F),
        Color(0xFF126AB2),
        Color(0xFF445276),
        Color(0xFF9EA9CE),
        Color(0xFFBFFF00),
        Color(0xFFD680C0),
      ];

  static List<Color> get backgroundColors => [
        Color(0xFFE7EAF3),
        Color(0xFFF0F2F8),
        Color(0xFFDDE1EE),
        Color(0xFFF6F6F6),
      ];
}
