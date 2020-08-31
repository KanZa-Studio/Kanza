import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kanza/presentation/pages/home/home_page.dart';

import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      ),
    );
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
