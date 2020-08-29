import 'package:flutter/material.dart';

import '../utils/constants/routes.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case editCategory:
        return MaterialPageRoute(
          builder: (_) => Scaffold(),
        );
      case archives:
        return MaterialPageRoute(
          builder: (_) => Scaffold(),
        );
      case about:
        return MaterialPageRoute(
          builder: (_) => Scaffold(),
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
