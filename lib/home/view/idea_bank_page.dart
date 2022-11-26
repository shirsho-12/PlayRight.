import 'package:flutter/material.dart';
import 'package:play_right/app_ui.dart';
import 'package:play_right/models/user.dart';
import 'package:play_right/shared_widgets.dart';
// import 'dart:developer' as devtools show log;

class IdeaBankPage extends StatelessWidget {
  const IdeaBankPage({Key? key}) : super(key: key);

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
                  'Your archive',
                  style: PlayRightTextStyle.headline5,
                ),
                GridView.count(
                    primary: true,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(6),
                    children: List.generate(
                        user.archive.length, //this is the total number of cards
                        (index) {
                      final data = user.archive[index];
                      final String month;
                      switch (data.time.month) {
                        case 1:
                          month = "january";
                          break;
                        case 2:
                          month = "february";
                          break;
                        case 3:
                          month = "march";
                          break;
                        case 4:
                          month = "april";
                          break;
                        case 5:
                          month = "may";
                          break;
                        case 6:
                          month = "june";
                          break;
                        case 7:
                          month = "july";
                          break;
                        case 8:
                          month = "august";
                          break;
                        case 9:
                          month = "september";
                          break;
                        case 10:
                          month = "october";
                          break;
                        case 11:
                          month = "november";
                          break;
                        default:
                          month = "december";
                          break;
                      }
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  title: Text(data.promptText),
                                  content: PromptDialog(name: data.promptText),
                                );
                              });
                        },
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 16.0, bottom: 8.0, right: 8.0),
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      "${data.time.day} ${month.toTitleCase()} ${data.time.year}\n",
                                  style: PlayRightTextStyle.bodyText1
                                      .copyWith(color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: data.promptText,
                                        style:
                                            PlayRightTextStyle.title.copyWith(
                                          color: PlayRightColors.accent,
                                        )),
                                  ]),
                            ),
                          ),
                        ),
                      );
                    }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
