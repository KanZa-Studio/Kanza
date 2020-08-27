import 'package:flutter/material.dart';

import './colors.dart';
import './fonts.dart';

final defaultTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: primaryColor,
  scaffoldBackgroundColor: pageBackgroundColor,
  textTheme: TextTheme(
    headline5: f24W900,
    caption: f12W500,
    headline6: f22W900,
    bodyText1: f16w500,
    bodyText2: f14W500,
    headline3: f40W900,
    headline2: f60W900,
    headline4: f20W500,
  ),
);
