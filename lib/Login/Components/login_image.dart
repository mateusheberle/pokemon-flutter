import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Image.asset(
          'assets/splash.png',
          width: 150,
        ),
      ),
    );
  }
}
