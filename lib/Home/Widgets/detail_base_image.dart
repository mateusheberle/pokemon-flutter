import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:flutter/material.dart';

import '../../Common/Model/arguments.dart';
import '../Shared/imagem_network.dart';

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
            builder: (context, value, child) => AnimatedCrossFade(
              duration: const Duration(milliseconds: 1500),
              firstCurve: Curves.decelerate,
              secondCurve: Curves.easeInOut,
              sizeCurve: Curves.decelerate,
              firstChild: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(AppStyle.roundAllCorners)),
                child: ImageNetwork(
                  url: arguments.pokemon!.sprites?[0] ?? '',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              secondChild: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(AppStyle.roundAllCorners)),
                child: ImageNetwork(
                  url: arguments.pokemon!.sprites?[1] ?? '',
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              crossFadeState: crossFade.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
      ),
    );
  }
}
