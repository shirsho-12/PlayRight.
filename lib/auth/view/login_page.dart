import 'package:flutter/material.dart';
import 'package:play_right/app_ui.dart';
import 'package:play_right/auth/appwrite_auth_provider.dart';

//TODO: IsEnabled has to be improved, is not responsive enough -> needs BLoC

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEnabled = false;
  bool _isUserNameIconVisible = false;
  bool _isPasswordIconVisible = false;

  final AppWriteAuthProvider _authProvider = AppWriteAuthProvider();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('PlayRight.',
            style: PlayRightTextStyle.title, textAlign: TextAlign.center),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 40),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context);
                },
              )),
          Center(
            child: SizedBox(
              width: width * 0.8,
              height: height * 0.8,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Welcome back!\n",
                          style: PlayRightTextStyle.title.copyWith(
                            color: PlayRightColors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                                text: "Sign in to begin generating",
                                style: PlayRightTextStyle.overline),
                          ])),
                  Text('Login', style: PlayRightTextStyle.title),
                  const SizedBox(height: 20),
                  // const Align(
                  //     alignment: Alignment.centerLeft, child: Text("USERNAME")),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black)),
                    ),
                    child: TextField(
                      onChanged: ((value) {
                        setState(() {
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            _isEnabled = true;
                          } else {
                            _isEnabled = false;
                          }
                          if (_emailController.text.isNotEmpty) {
                            _isUserNameIconVisible = true;
                          } else {
                            _isUserNameIconVisible = false;
                          }
                        });
                      }),
                      controller: _emailController,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        border: InputBorder.none,
                        labelText: 'USERNAME',
                        labelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: _isUserNameIconVisible
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                color: Colors.black,
                                onPressed: _emailController.clear)
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // const Align(
                  //     alignment: Alignment.bottomLeft, child: Text("PASSWORD")),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black)),
                    ),
                    child: TextField(
                      onChanged: ((value) {
                        setState(() {
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty) {
                            _isEnabled = true;
                          } else {
                            _isEnabled = false;
                          }
                          if (_passwordController.text.isNotEmpty) {
                            _isPasswordIconVisible = true;
                          } else {
                            _isPasswordIconVisible = false;
                          }
                        });
                      }),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'PASSWORD',
                        labelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: _isPasswordIconVisible
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                color: Colors.black,
                                onPressed: _passwordController.clear)
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final String email = _emailController.text;
                      final String password = _passwordController.text;
                      _authProvider.logIn(email: email, password: password);

                      if (_isEnabled) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route<dynamic> route) => false);
                      }
                    },
                    style: _isEnabled
                        ? PlayRightButtonStyle.enabled
                        : PlayRightButtonStyle.disabled,
                    child: const Text('Login'),
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
