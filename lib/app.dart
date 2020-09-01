import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './my_scroll_behavior.dart';
import './presentation/pages/splash/splash_page.dart';
import './presentation/values/themes.dart';
import './utils/localization_helper/localization_helper.dart';
import './presentation/router.dart';

class KanzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanza',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      locale: const Locale('en', 'US'),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('az', 'AZ'),
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
  }
}
