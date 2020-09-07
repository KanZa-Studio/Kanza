import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './my_scroll_behavior.dart';
import './presentation/pages/splash/splash_page.dart';
import './presentation/values/themes.dart';
import './utils/localization_helper/localization_helper.dart';
import './presentation/router.dart';
import './blocs/localization_cubit/localization_cubit.dart';
import './blocs/theme_cubit/theme_cubit.dart';

class KanzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, localizationState) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              title: 'Kanza',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeState.themeMode,
              locale: localizationState.locale,
              supportedLocales: [
                Locale('en', 'US'),
                Locale('az', 'AZ'),
                Locale('ru', 'RU'),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              onGenerateRoute: Router.onGenerateRoute,
              builder: (context, child) {
                return ScrollConfiguration(
                  behavior: MyBehaviour(),
                  child: child,
                );
              },
              home: SplashPage(),
            );
          },
        );
      },
    );
  }
}
