import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:flutter/material.dart';

class BotaoCompartilhar extends StatelessWidget {
  const BotaoCompartilhar({
    super.key,
    required this.arguments,
    required this.globalKey,
  });

  final Arguments arguments;
  final GlobalKey<State<StatefulWidget>> globalKey;

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
          onTap: () async {
            await Future.delayed(const Duration(milliseconds: 1000));
            await arguments.homePageController.capturePng(globalKey);
          },
          customBorder: const CircleBorder(),
          child: Ink(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
