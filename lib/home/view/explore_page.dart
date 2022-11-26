import 'package:flutter/material.dart';
import 'package:play_right/app_ui.dart';
import 'package:play_right/models/user.dart';
import 'package:play_right/shared_widgets.dart';
import 'dart:developer' as devtools show log;

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = User.dummy;
    List<String> fantasyList = [
      'high_fantasy',
      'urban_fantasy',
      'mythic',
      'super_human',
      'fairy_tale',
      'magic'
    ];
    List<String> scifiList = [
      'steam_punk',
      'cyber_punk',
      'space_opera',
      'dystopia',
      'time_travel'
    ];
    List<String> popCultureList = ['retro', 'y2k', 'academia', 'pop_art'];

    List<String> thrillerList = [
      'horror',
      'mystery',
      'super_natural',
      'crime',
      'techno'
    ];

    return Scaffold(
      appBar: playRightAppBar(),
      drawer: playRightDrawer(user, context),
      body: Stack(
        children: [
          const Background(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What are you looking for?',
                    style: PlayRightTextStyle.headline5,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fantasy'.toUpperCase(),
                      style: PlayRightTextStyle.bodyText1,
                    ),
                  ),
                  HorizontalList(
                    title: 'Fantasy',
                    imageList: fantasyList,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sci-Fi'.toUpperCase(),
                      style: PlayRightTextStyle.bodyText1,
                    ),
                  ),
                  HorizontalList(
                    title: 'Sci-Fi',
                    imageList: scifiList,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pop Culture'.toUpperCase(),
                      style: PlayRightTextStyle.bodyText1,
                    ),
                  ),
                  HorizontalList(
                    title: 'Pop Culture',
                    imageList: popCultureList,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Thriller'.toUpperCase(),
                      style: PlayRightTextStyle.bodyText1,
                    ),
                  ),
                  HorizontalList(
                    title: 'Thriller',
                    imageList: thrillerList,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  const HorizontalList({required this.title, required this.imageList, Key? key})
      : super(key: key);
  final List<String> imageList;
  final String title;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 6;
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          final String name =
              imageList[index].replaceAll('_', ' ').toTitleCase();

          return SizedBox(
            width: height,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  devtools.log("Tile tapped $name");
                  showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(name),
                          content: PromptDialog(name: name),
                        );
                      });
                },
                child: Stack(
                  children: [
                    Image.asset(
                        "assets/images/explore_imgs/${imageList[index]}.png"),
                    Align(
                        alignment: const Alignment(0.0, 0.0),
                        child: Text(
                          name.replaceAll(" ", "\n"),
                          style: PlayRightTextStyle.headline5
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
