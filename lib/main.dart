import 'package:flutter/material.dart';
import 'package:play_right/routes.dart';
import 'app_ui.dart';
// import 'home/data/gpt_3.dart';
// import 'dart:developer' as devtools show log;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // List<String> promptList = await promptTexts('a historical fantasy adventure');
  // for (var prompt in promptList) {
  // devtools.log(prompt);
  // }

  // runApp(MultiBlocProvider(providers: [
  // BlocProvider<AuthBloc>(
  // create: (context) => AuthBloc(AppWriteAuthProvider()),
  // ),
  // ], child: const MyApp()));
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
      initialRoute: RouteGenerator.landingPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
