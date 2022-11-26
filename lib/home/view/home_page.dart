import 'package:flutter/material.dart';
import 'package:play_right/app_ui.dart';
import 'package:play_right/models/user.dart';
import 'package:play_right/shared_widgets.dart';

//TODO: Navigation to other pages - Drawer
//TODO: Figure out a way to make the transparent buttons rounded

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = User.dummy;

    return Scaffold(
      appBar: playRightAppBar(),
      drawer: playRightDrawer(user, context),
      body: Stack(
        children: [
          const Background(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'How can we inspire you today?',
                  style: PlayRightTextStyle.headline5,
                ),
                const SizedBox(height: 30),
                const HomeButton(
                  imagePath: 'assets/images/generate.png',
                  headLine: "Generate a prompt\n",
                  caption: "Customize your prompt using keywords",
                  nextPage: '/prompt',
                ),
                const HomeButton(
                  imagePath: 'assets/images/generate.png',
                  headLine: "Explore Prompts\n",
                  caption: "Get inspired by our idea catelogue",
                  nextPage: '/explore',
                ),
                const HomeButton(
                  imagePath: 'assets/images/generate.png',
                  headLine: "Idea Bank\n",
                  caption: "View your previous prompt collection",
                  nextPage: '/idea_bank',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key? key,
    required this.imagePath,
    required this.headLine,
    required this.caption,
    required this.nextPage,
  }) : super(key: key);
  final String imagePath;
  final String headLine;
  final String caption;
  final String nextPage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.9;
    return SizedBox(
      width: width,
      height: height / 4,
      child: Container(
        decoration: const FooDecoration(),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, nextPage);
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all<Color>(PlayRightColors.transparent),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(imagePath),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: headLine,
                      style: PlayRightTextStyle.title.copyWith(
                        color: PlayRightColors.accent,
                        fontSize: 24.0,
                        fontWeight: PlayRightFontWeight.regular,
                      ),
                      children: [
                        TextSpan(
                            text: caption,
                            style: PlayRightTextStyle.caption
                                .copyWith(color: PlayRightColors.black)),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
