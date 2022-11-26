// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer' as devtools show log;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:play_right/app_ui.dart';
import 'package:play_right/models/prompt.dart';
import 'package:play_right/models/user.dart';
import 'package:play_right/shared_widgets.dart';

class PromptPage extends StatefulWidget {
  const PromptPage({Key? key}) : super(key: key);

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  final _textController = TextEditingController();
  bool _isEnabled = false;
  bool _onSubmit = false;

  @override
  Widget build(BuildContext context) {
    User user = User.dummy;
    double pad = 16.0;
    double width = MediaQuery.of(context).size.width - pad * 2;
    double height = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: playRightAppBar(),
      drawer: playRightDrawer(user, context),
      body: Stack(
        children: [
          const Background(),
          Padding(
            padding: EdgeInsets.all(pad),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'TYPE IN YOUR TOPIC',
                    style: PlayRightTextStyle.bodyText2,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: width,
                  height: height / 4,
                  decoration: const FooDecoration(),
                  child: Padding(
                    padding: EdgeInsets.only(left: pad, right: pad),
                    child: Stack(
                      children: [
                        TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _textController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'E.g. a historical fantasy adventure',
                          ),
                          onChanged: ((value) => setState(() {
                                _isEnabled = value.isNotEmpty;
                              })),
                        ),
                        Align(
                          alignment: const Alignment(0.9, 0.65),
                          child: SizedBox(
                            width: width / 2.25,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_textController.text.isNotEmpty) {
                                  devtools.log("Generating prompt...");
                                  setState(() {
                                    _onSubmit = true;
                                  });
                                }
                              },
                              style: _isEnabled
                                  ? PlayRightButtonStyle.enabled
                                  : PlayRightButtonStyle.disabled,
                              child: const Text('GENERATE'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                _onSubmit ? const PromptCard() : const SizedBox(),
                const SizedBox(height: 30),
                _onSubmit
                    ? Container(
                        width: width,
                        padding: EdgeInsets.only(left: pad, right: pad),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.file_upload_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconData(0xf2bf,
                                    fontFamily: CupertinoIcons.iconFont,
                                    fontPackage:
                                        CupertinoIcons.iconFontPackage),
                                size: 30,
                              ),
                              color: Colors.white,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ],
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: PlayRightColors.black,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bookmark),
      //       label: 'Bookmark',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.file_upload_outlined),
      //       label: 'Share',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(IconData(0xf2bf,
      //           fontFamily: CupertinoIcons.iconFont,
      //           fontPackage: CupertinoIcons.iconFontPackage)),
      //       label: 'Edit',
      //     ),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like'),
      //   ],
      // ),
    );
  }
}

class PromptCard extends StatelessWidget {
  const PromptCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Prompt prompt = Prompt.dummy;
    double pad = 16.0;
    double width = MediaQuery.of(context).size.width - pad * 2;
    double height = MediaQuery.of(context).size.height * 0.35;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: PlayRightColors.subtext,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 4)
        ],
      ),
      child: Card(
        color: PlayRightColors.subtext,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(pad),
            child: ListView.builder(
                itemCount: prompt.promptResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: UnorderedListItem(text: prompt.promptResults[index]),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• ",
            style: PlayRightTextStyle.headline6.copyWith(color: Colors.white)),
        Expanded(
          child: Text(text,
              style:
                  PlayRightTextStyle.headline6.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
