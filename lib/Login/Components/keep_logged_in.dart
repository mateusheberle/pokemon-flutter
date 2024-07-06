import 'package:ebac_flutter/Login/Controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class KeepLoggedIn extends StatelessWidget {
  const KeepLoggedIn({
    super.key,
    required LoginController controller,
  }) : _controller = controller;

  final LoginController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Permanecer logado?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            width: 16,
          ),
          Switcher(
            value: _controller.keepLoggedIn.value,
            size: SwitcherSize.large,
            switcherButtonRadius: 50,
            enabledSwitcherButtonRotate: false,
            iconOff: Icons.lock,
            iconOn: Icons.lock_open,
            colorOff: Colors.blueGrey.withOpacity(0.3),
            colorOn: Colors.blue,
            onChanged: (bool state) {
              _controller.keepLoggedIn.value = state;
            },
          ),
        ],
      ),
    );
  }
}
