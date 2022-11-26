import 'package:flutter/material.dart';
import 'package:play_right/landing/view/landing_page.dart';

import 'auth/auth.dart';
import 'home/home.dart';

class RouteGenerator {
  static const String landingPage = '/';
  static const String loginPage = '/login';
  static const String signUpPage = '/signup';
  static const String homePage = '/home';
  static const String promptPage = '/prompt';
  static const String explorePage = '/explore';
  static const String ideaBankPage = '/idea-bank';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signUpPage:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case promptPage:
        return MaterialPageRoute(builder: (_) => const PromptPage());
      case explorePage:
        return MaterialPageRoute(builder: (_) => const ExplorePage());
      case ideaBankPage:
        return MaterialPageRoute(builder: (_) => const IdeaBankPage());

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
