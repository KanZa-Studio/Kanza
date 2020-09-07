import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';
import '../welcome/welcome_page.dart';
import '../../../data/services/shared_preferences_service.dart';
import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: 2), () async {
      final logged = (await SharedPreferencesService.instance).userLogged;
      Navigator.pushReplacementNamed(
          context, logged != null && logged ? '/home' : '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          kanza,
          style: Theme.of(context).textTheme.headline2,
        ).tr(),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
