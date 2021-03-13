import 'package:flutter/material.dart';

class ColorExtensions {
  static Color fromString(String color) {
    if (color != null) {
      return Color(int.parse(color.toUpperCase()));
    }
    return null;
  }
}
