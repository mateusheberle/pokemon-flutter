import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Shared/imagem_network.dart';
import 'package:flutter/material.dart';

class DetailBaseImage extends StatelessWidget {
  const DetailBaseImage({
    super.key,
    required this.arguments,
    required this.crossFade,
  });

  final Arguments arguments;
  final ValueNotifier<bool> crossFade;

  @override
  Widget build(BuildContext context) {
    // print('detail: ' + arguments.tag);
    return SingleChildScrollView(
      child: Hero(
        tag: arguments.tag,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.greenAccent,
            border: Border.all(color: Colors.greenAccent, width: 3.0),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ValueListenableBuilder<bool>(
            valueListenable: crossFade,
            builder: (context, value, child) => ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppStyle.roundAllCorners)),
              child: ImageNetwork(
                url: arguments.pokemon.sprites!,
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
