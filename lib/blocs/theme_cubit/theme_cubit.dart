import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/services/preferences_store_service.dart';

part './theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeMode defaultThemeMode) : super(ThemeState(defaultThemeMode));

  final _preferencesStoreService = PreferencesStoreService.instance;

  final _darkModeEnabledController = StreamController<bool>();
  Stream<bool> get darkModeEnabled => _darkModeEnabledController.stream;

  void changeTheme(bool value) async {
    final isDarkModeEnabled = _preferencesStoreService.isDarkModeEnabled;

    if (isDarkModeEnabled == value) return;

    await _preferencesStoreService.setDarkModeInfo(value);

    emit(ThemeState(value ? ThemeMode.dark : ThemeMode.light));
  }

  Future<ThemeMode> loadDefaultTheme() async {
    final isDarkModeEnabled = _preferencesStoreService.isDarkModeEnabled;

    ThemeMode defaultThemeMode;

    if (isDarkModeEnabled == null) {
      /// it will check that if default system theme if [Dark] or[Light]

      if (ThemeMode.system == ThemeMode.dark) {
        defaultThemeMode = ThemeMode.dark;
      } else {
        defaultThemeMode = ThemeMode.light;
      }
    } else {
      /// if user selected any theme manually in app
      /// then it will be loaded along app while
      /// user clear all data of app
      defaultThemeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
    }

    return defaultThemeMode;
  }

  @override
  Future<void> close() {
    _darkModeEnabledController?.close();
    return super.close();
  }
}
