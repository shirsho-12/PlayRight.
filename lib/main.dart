import 'package:flutter/material.dart';
import 'app_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayRight',
      theme: PlayRightTheme.standard,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('PlayRight.', style: PlayRightTextStyle.title),
        ),
      ),
    );
  }
}
