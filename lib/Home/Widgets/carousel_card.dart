import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Home/Controller/home_controller.dart';
import 'package:ebac_flutter/Home/Page/pokemon_detail.dart';
import 'package:ebac_flutter/Home/Shared/imagem_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.index,
    required this.name,
    required this.pokemon,
    required this.color,
    required this.homePageController,
    required this.indexSelectedContainer,
    required this.sizeSelectedContainer,
    required this.itemFocusNode,
  });

  final int index;
  final String name;
  final Pokemon pokemon;
  final Color color;
  final HomePageController homePageController;
  final ValueNotifier<int> indexSelectedContainer;
  final ValueNotifier<double> sizeSelectedContainer;
  final ValueNotifier<FocusNode> itemFocusNode;

  @override
  Widget build(BuildContext context) {
    var tag = homePageController.generateTag();
    return ValueListenableBuilder<int>(
      valueListenable: indexSelectedContainer,
      builder: (context, value, _) {
        return InkWell(
          onTap: () {
            if (indexSelectedContainer.value == index) {
              indexSelectedContainer.value = -1;
            } else {
              indexSelectedContainer.value = index;
              sizeSelectedContainer.value = 200;
              itemFocusNode.value.requestFocus();
            }
            itemFocusNode.value.requestFocus();
            Future.delayed(const Duration(milliseconds: 700));

            // final result = await Navigator.pushNamed(
            //   context,
            //   '/PokemonDetail',
            //   arguments: Arguments(
            //     title: title,
            //     homePageController: homePageController,
            //     movie: movie,
            //   ),
            // );
            // print(result);

            final result = Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 1000),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => PokemonDetail(
                  pokemon: pokemon,
                ),
                settings: RouteSettings(
                  arguments: Arguments(
                    tag: tag,
                    homePageController: homePageController,
                    pokemon: pokemon,
                  ),
                ),
              ),
            );

            if (kDebugMode) {
              print(result);
            }
          },
          focusNode: itemFocusNode.value,
          child: Container(
            // duration: const Duration(milliseconds: 1500),
            // curve: Curves.decelerate,
            width: sizeSelectedContainer.value,
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            decoration: BoxDecoration(
              color: indexSelectedContainer.value == index
                  ? Colors.greenAccent
                  : null,
            ),
            child: ImageItem(pokemon: pokemon, tag: tag),
          ),
        );
      },
    );
  }
}
