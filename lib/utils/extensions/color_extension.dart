import 'package:flutter/material.dart';

extension ColorToStringExtension on Color {
  String toStringColor() {
    String colorString = this.toString();
    String valueString = colorString.split('(0x')[1].split(')')[0];
    return valueString;
  }
}

extension StringToColorExtension on String {
  toColor() {
    int value = int.parse(this, radix: 16);
    return Color(value);
  }
}
