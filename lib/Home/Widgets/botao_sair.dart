import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BotaoSair extends StatefulWidget {
  const BotaoSair({
    super.key,
  });

  @override
  State<BotaoSair> createState() => _BotaoSairState();
}

class _BotaoSairState extends State<BotaoSair> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          splashColor: Colors.black,
          onTap: () {
            // await Future.delayed(const Duration(milliseconds: 1000));
            clearSharedPreferences(context);
          },
          customBorder: const CircleBorder(),
          child: Ink(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void clearSharedPreferences(BuildContext context) async {
    _saveDataToLocalStorage().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/loginPage');
      }
    });
  }

  Future<bool> _saveDataToLocalStorage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }
}
