import 'package:flutter/material.dart';
import 'package:trzapp/core/values/routes.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/create_account_pages.dart';
import 'package:trzapp/features/start/presentation/pages/fable/fable_page.dart';
import 'package:trzapp/features/start/presentation/pages/splash/splash_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );
      case Routes.fable:
        return MaterialPageRoute(
          builder: (_) => FablePage(),
        );
      case Routes.createAccount:
        return MaterialPageRoute(
          builder: (_) => CreateAccountPage(),
        );
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
