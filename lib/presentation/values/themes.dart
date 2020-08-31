import 'package:flutter/material.dart';
import 'package:kanza/presentation/values/colors.dart';

import './fonts.dart';

final lightTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: LightThemeColor.kPrimaryColor,
  scaffoldBackgroundColor: LightThemeColor.kScaffoldBackgroundColor,
  textTheme: TextTheme(
    headline6: f22W900.copyWith(color: LightThemeColor.kPrimaryColor),
    // headline5: f24W900,
    // caption: f12W500,
    // headline6: f22W900,
    // bodyText1: f16w500,
    // bodyText2: f14W500,
    // headline3: f40W900,
    // headline2: f60W900,
    // headline4: f20W500,
  ),
);

final darkTheme = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: DarkThemeColor.kPrimaryColor,
  scaffoldBackgroundColor: DarkThemeColor.kScaffoldBackgroundColor,
  textTheme: TextTheme(
    headline6: f22W900.copyWith(color: DarkThemeColor.kPrimaryColor),
  ),
);
