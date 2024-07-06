import 'dart:convert';

import 'package:ebac_flutter/Common/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> enableLoginButton = ValueNotifier<bool>(false);
  ValueNotifier<bool> keepLoggedIn = ValueNotifier<bool>(false);

  LoginController() {
    loginController.addListener(() {
      _enableLoginButton();
    });
    passwordController.addListener(() {
      _enableLoginButton();
    });
  }

  void _enableLoginButton() {
    enableLoginButton.value = loginController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty;
  }

  Future<bool> tryLogin() async {
    // debugPrint('login: ${loginController.value.text}');
    // debugPrint('senha: ${passwordController.value.text}');
    // debugPrint('keep: ${keepLoggedIn.value}');

    if (loginController.value.text == 'admin' &&
        passwordController.value.text == 'admin') {
      debugPrint('login correto');
      return _saveDataToLocalStorage();
    }
    return false;
  }

  Future<void> getKeepLoggedInValue() async {
    // iniciando o shared preferences
    SharedPreferences prefs = await _startSharedPreferences();

    // recuperar o valor do permancer logado
    keepLoggedIn.value = prefs.getBool('keepLoggedIn') ?? false;
  }

  Future<SharedPreferences> _startSharedPreferences() async {
    // iniciando o shared preferences
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> _saveDataToLocalStorage() async {
    try {
      // iniciando o shared preferences
      SharedPreferences prefs = await _startSharedPreferences();

      // salvando o valor do permancer logado
      await prefs.setBool('keepLoggedIn', keepLoggedIn.value);

      // criando os dados para salvar localmente
      Map<String, dynamic> loginData = UserModel(
        login: loginController.value.text,
        nickName: 'mateus_auler',
        password: passwordController.value.text,
      ).toJson();

      await prefs.setString('userModel', jsonEncode(loginData));

      return true;
    } catch (e) {
      return false;
    }
  }
}
