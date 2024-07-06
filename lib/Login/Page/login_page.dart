import 'package:flutter/material.dart';

import '../Components/keep_logged_in.dart';
import '../Components/login_fields.dart';
import '../Components/login_image.dart';
import '../Components/sign_in.dart';
import '/Login/Controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
  }

  @override
  void dispose() {
    _controller.loginController.dispose();
    _controller.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          const LoginImage(),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginFields(
                controller: _controller.loginController,
                label: 'login',
                isPassword: false,
              ),
              LoginFields(
                controller: _controller.passwordController,
                label: 'password',
                isPassword: true,
              ),
              KeepLoggedIn(controller: _controller),
              SignIn(controller: _controller),
            ],
          )
        ],
      ),
    );
  }
}
