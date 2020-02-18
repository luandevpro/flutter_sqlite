import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sqlite/core/constants/app_contstants.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/post_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutePaths.Login:
        final data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => LoginView(data: data));
      case RoutePaths.Post:
        return MaterialPageRoute(builder: (_) => PostView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
