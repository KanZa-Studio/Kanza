import 'package:flutter/material.dart';
import '../login/login_page.dart';
import '../../../utils/constants/language_keys.dart';
import '../../../utils/extensions/translator.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LoginPage(),
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
          LanguageKeys.kanza,
          style: Theme.of(context).textTheme.headline2,
        ).tr(),
      ),
    );
  }
}
