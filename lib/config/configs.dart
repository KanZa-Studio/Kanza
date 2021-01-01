import 'package:flutter/material.dart';

import '../blocs/localization_cubit/localization_cubit.dart';
import '../blocs/theme_cubit/theme_cubit.dart';
import '../data/services/preferences_store_service.dart';

class Configs {
  /// You should await for it to ensure that
  /// all [Services] and configurations
  /// successfully initialized
  Future<void> initServices() => Future.wait([
        PreferencesStoreService.init(),
      ]);

  /// Logic for localization initialization
  Future<Locale> get locale async {
    final LocalizationCubit localizationCubit = LocalizationCubit(null);
    final defaultLocale = await localizationCubit.loadDefaultLocale();
    await localizationCubit?.close();
    return defaultLocale;
  }

  /// Logic for theme initialization
  Future<ThemeMode> get theme async {
    final ThemeCubit themeCubit = ThemeCubit(null);
    final defaultThemeMode = await themeCubit.loadDefaultTheme();
    await themeCubit?.close();
    return defaultThemeMode;
  }
}
