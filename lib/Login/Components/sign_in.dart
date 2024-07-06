import 'package:flutter/material.dart';

import '../Controller/login_controller.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    super.key,
    required LoginController controller,
  }) : _controller = controller;

  final LoginController _controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.enableLoginButton,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: !_controller.enableLoginButton.value
              ? null
              : () async {
                  if (await _controller.tryLogin()) {
                    // login correto
                    _callShowDialogAlert(context, true);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/homePage', (Route<dynamic> rote) => false);
                  } else {
                    // login incorreto
                    _callShowDialogAlert(context, false);
                  }
                },
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: Text('Entrar'),
          ),
        );
      },
    );
  }

  Future<dynamic> _callShowDialogAlert(context, bool isCorrect) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          actionsOverflowButtonSpacing: 50,
          titlePadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
          titleTextStyle: const TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
          title: const Center(child: Text('Alerta de Login')),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isCorrect
                    ? 'usuário autentifado com SUCESSO'
                    : 'usuário e senha INCORRETO',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
