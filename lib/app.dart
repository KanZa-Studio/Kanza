import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './my_scroll_behavior.dart';
import './presentation/pages/splash/splash_page.dart';
import './presentation/values/themes.dart';
import './utils/localization_helper/localization_helper.dart';

class KanzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      locale: const Locale('en', 'US'),
      supportedLocales: [
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehaviour(),
          child: child,
        );
      },
      home:  SplashPage(),
    );
  }
}
