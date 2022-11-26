import 'package:flutter/material.dart';
import 'package:play_right/landing/widgets/landing_body.dart';

/// {@template landing_page}
/// A description for LandingPage
/// {@endtemplate}
class LandingPage extends StatelessWidget {
  /// {@macro landing_page}
  const LandingPage({Key? key}) : super(key: key);

  /// The static route for LandingPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LandingPage());
  }
   
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingView(),
    );
  } 
}

/// {@template landing_view}
/// Displays the Body of LandingView
/// {@endtemplate}
class LandingView extends StatelessWidget {
  /// {@macro landing_view}
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LandingBody();
  }
}
