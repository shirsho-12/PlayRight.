import 'package:flutter/material.dart';
import 'package:play_right/landing/view/landing_page.dart';

import 'auth/auth.dart';

class RouteGenerator {
  static const String landingPage = '/';
  static const String loginPage = '/login';
  static const String signUpPage = '/signup';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signUpPage:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      //   return MaterialPageRoute(builder: (_) => const LandingPage());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('404 Route Not Found'),
                  ),
                ));
    }
  }
}
