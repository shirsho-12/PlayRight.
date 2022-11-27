import 'package:flutter/material.dart';
import 'package:play_right/app_ui.dart';

export 'landing_body.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
          height: height,
          child: Column(children: [
            Image(
              image: const AssetImage(
                'assets/images/pana.png',
              ),
              width: width * 2 / 3,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "PlayRight.\n",
                    style: PlayRightTextStyle.title.copyWith(
                      color: PlayRightColors.black,
                      fontSize: 60.0,
                    ),
                    children: [
                      TextSpan(
                          text: "Unblock your creative flow.",
                          style: PlayRightTextStyle.headline5),
                    ]))
          ])),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 2 / 3;
    return SizedBox(
        width: buttonWidth,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text("SIGN IN")));
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 2 / 3;
    return SizedBox(
        width: buttonWidth,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            style: PlayRightTheme.standard.elevatedButtonTheme.style!.copyWith(
              backgroundColor:
                  MaterialStateProperty.all<Color>(PlayRightColors.black),
            ),
            child: const Text("REGISTER")));
  }
}
