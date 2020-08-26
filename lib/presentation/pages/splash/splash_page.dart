import 'package:flutter/material.dart';
import 'package:kanza/presentation/pages/login/login_page.dart';

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
          'kanza.',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
