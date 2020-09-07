import 'package:flutter/material.dart';

import '../utils/constants/routes.dart';
import './pages/home/home_page.dart';
import './pages/welcome/welcome_page.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case '/welcome':
        return MaterialPageRoute(
          builder: (_) => WelcomPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Page is not provided => ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
