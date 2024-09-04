import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Shared/imagem_network.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.pokemon,
    required this.tag,
  });

  final Pokemon pokemon;
  final String tag;

  @override
  Widget build(BuildContext context) {
    // print('imagems:' + tag);
    return Container(
      margin: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius:
            const BorderRadius.all(Radius.circular(AppStyle.roundAllCorners)),
        child: Stack(
          children: [
            Hero(
              tag: tag,
              child: ImageNetwork(
                url: pokemon.sprites!,
                fit: BoxFit.contain,
                height: 350,
                width: null,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 20.0),
                child: Center(
                  child: Stack(
                    children: [
                      Text(
                        pokemon.name,
                        style: TextStyle(
                          fontSize: 10.0,
                          foreground: Paint()
                            ..strokeWidth = 1
                            ..style = PaintingStyle.stroke
                            ..strokeJoin = StrokeJoin.round
                            ..color = Colors.white,
                        ),
                      ),
                      Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
