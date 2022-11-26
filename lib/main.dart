import 'package:flutter/material.dart';
import 'package:play_right/routes.dart';
import 'app_ui.dart';
import 'auth/auth.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
    ),
  ], child: const MyApp()));
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
      initialRoute: RouteGenerator.loginPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
