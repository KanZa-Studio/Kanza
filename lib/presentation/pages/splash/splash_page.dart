import 'dart:async';

import 'package:flutter/material.dart';
import '../../../data/services/shared_preferences_service.dart';

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
          'kanza.',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
