import 'package:flutter/material.dart';

import 'widgets.dart';

/// {@template landing_body}
/// Body of the LandingPage.
///
/// Add what it does
/// {@endtemplate}
class LandingBody extends StatelessWidget {
  /// {@macro landing_body}
  const LandingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Flex(
        mainAxisSize: height > width ? MainAxisSize.max : MainAxisSize.min,
        direction: height > width ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TitleWidget(),
                  SizedBox(height: 50),
                  LoginButton(),
                  SizedBox(height: 20),
                  SignUpButton(),
                ],
              ),
            ),
          ),
        ]);
  }
}
