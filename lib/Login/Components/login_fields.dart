import 'package:flutter/material.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required String label,
    required bool isPassword,
    required TextEditingController controller,
  })  : _label = label,
        _isPassword = isPassword,
        _controller = controller;

  final String _label;
  final bool _isPassword;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        controller: _controller,
        obscureText: _isPassword,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true, // cor de preenchimento
          fillColor: Colors.white,
          hintText: _label,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
