import 'package:flutter/material.dart';

import './fonts.dart';
import './colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  primaryColor: LightThemeColor.kPrimaryColor,
  scaffoldBackgroundColor: LightThemeColor.kScaffoldBackgroundColor,
  cardColor: LightThemeColor.kTaskItemBackgroundColor,
  textTheme: TextTheme(
      headline2: f60W900.copyWith(color: Colors.white),
      headline3: f40W900.copyWith(color: LightThemeColor.kPrimaryColor),
      headline4: f20W500.copyWith(color: LightThemeColor.kPrimaryColor),
      headline6: f22W900,
      bodyText1: f16w500.copyWith(color: Colors.black),
      caption: f12.copyWith(color: LightThemeColor.kTodoItemSubtitleColor),
      overline: f10W500.copyWith(color: Colors.black),
      button: f14W500.copyWith(color: DarkThemeColor.homeTasksTextColor)
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
  cardColor: DarkThemeColor.kTaskItemBackgroundColor,
  textTheme: TextTheme(
    headline2: f60W900.copyWith(color: Colors.white),
    headline3: f40W900.copyWith(color: DarkThemeColor.kKanzaTitleTextColor),
    headline4: f20W500.copyWith(color: DarkThemeColor.kKanzaTitleTextColor),
    headline6: f22W900.copyWith(color: DarkThemeColor.kKanzaTitleTextColor),
    bodyText1: f16w500.copyWith(color: DarkThemeColor.homeTasksTextColor),
    caption: f12.copyWith(color: DarkThemeColor.kKanzaTitleTextColor),
    overline: f10W500.copyWith(color: Colors.white),
  ),
);
