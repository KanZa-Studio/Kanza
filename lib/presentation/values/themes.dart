import 'package:flutter/material.dart';
import 'package:kanza/presentation/values/colors.dart';

import './fonts.dart';

final lightTheme = ThemeData(
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  primaryColor: LightThemeColor.kPrimaryColor,
  scaffoldBackgroundColor: LightThemeColor.kScaffoldBackgroundColor,
  textTheme: TextTheme(
    headline2: f60W900.copyWith(color: Colors.white),
    headline6: f22W900,
    bodyText1: f16w500.copyWith(color: Colors.black),
    overline: f10W500.copyWith(color: Colors.black),
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
  brightness: Brightness.dark,
  primaryColor: DarkThemeColor.kPrimaryColor,
  scaffoldBackgroundColor: DarkThemeColor.kScaffoldBackgroundColor,
  textTheme: TextTheme(
    headline2: f60W900.copyWith(color: Colors.white),
    headline6: f22W900,
    bodyText1: f16w500.copyWith(color: DarkThemeColor.homeTasksTextColor),
    overline: f10W500.copyWith(color: Colors.black),
  ),
);
