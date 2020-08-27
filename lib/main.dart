import 'package:flutter/material.dart';

import './app.dart';
import './presentation/values/colors.dart';
import './utils/extensions/color_extension.dart';

void main() {
  runApp(KanzaApp());

  print('color to string: ${primaryColor.toStringColor()}');
  print('color to string: ${fabShadowColor.toStringColor()}');

  String value = primaryColor.toStringColor();
  print(value.toColor());
}
