import 'package:flutter/material.dart';

import '../../presentation/values/colors.dart';

extension ThemeExtension on ThemeData {
  Color get todayItemBackgroundColor =>
      LightThemeColor.todayItemBackgroundColor;

  Color get tomorrowItemBackgroundColor => isDark
      ? DarkThemeColor.tomorrowItemBackgroundColor
      : LightThemeColor.tomorrowItemBackgroundColor;

  Color get pickDateItemBackgroundColor =>
      LightThemeColor.pickADateTimeItemBackground;

  Color get selecteTimeItemBorderColor =>
      LightThemeColor.kSelectedTimeItemBorderColor;

  Color get filterTextColor =>
      isDark ? DarkThemeColor.homeTasksTextColor : Colors.black;

  bool get isDark => brightness == Brightness.dark;
}
