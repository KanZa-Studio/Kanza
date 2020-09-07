import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app.dart';
import './blocs/localization_cubit/localization_cubit.dart';
import './blocs/theme_cubit/theme_cubit.dart';
import './kanza_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = KanzaBlocObserver();

  final defaultLocale = await _getDefaultLocale();
  final defaultThemeMode = await _getDefaultTheme();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationCubit>(
          create: (_) => LocalizationCubit(defaultLocale),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(defaultThemeMode),
        ),
      ],
      child: KanzaApp(),
    ),
  );
}

/// Logic for localization initialization
Future<Locale> _getDefaultLocale() async {
  final LocalizationCubit localizationCubit = LocalizationCubit(null);
  final defaultLocale = await localizationCubit.loadDefaultLocale();
  await localizationCubit?.close();
  return defaultLocale;
}

/// Logic for theme initialization
Future<ThemeMode> _getDefaultTheme() async {
  final ThemeCubit themeCubit = ThemeCubit(null);
  final defaultThemeMode = await themeCubit.loadDefaultTheme();
  await themeCubit?.close();
  return defaultThemeMode;
}
