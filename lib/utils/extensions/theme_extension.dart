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

  Color get topBarDrawerOpenerColor =>
      isDark ? Color(0xFFFAFAFA) : LightThemeColor.kPrimaryColor;

  Color get filterIconColor => isDark ? Colors.white : Colors.black;

  Color get drawerBackgroundColor =>
      isDark ? DarkThemeColor.kDrawerBackgroundColor : Colors.white;

  Color get drawerItemIconColor =>
      isDark ? null : LightThemeColor.kDrawerIconColor;

  Color get drawerItemTextColor => isDark
      ? DarkThemeColor.kKanzaTitleTextColor
      : LightThemeColor.kDrawerIconColor;

  bool get isDark => brightness == Brightness.dark;
}
