import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Home/Controller/home_controller.dart';
import 'package:ebac_flutter/Home/Widgets/carousel_card.dart';
import 'package:flutter/material.dart';

// import '../../Common/Model/movie.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
    required this.name,
    required this.type,
    required this.showType,
    required this.initialPage,
    required this.pokemons,
    required this.homePageController,
  });

  final String name;
  final String type;
  final bool showType;
  final int initialPage;
  final List<Pokemon> pokemons;
  final HomePageController homePageController;

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  ValueNotifier<int> indexSelectedContainer = ValueNotifier<int>(-1);
  ValueNotifier<double> sizeSelectedContainer = ValueNotifier<double>(150);
  ValueNotifier<FocusNode> itemFocusNode =
      ValueNotifier<FocusNode>(FocusNode());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    indexSelectedContainer.dispose();
    sizeSelectedContainer.dispose();
    itemFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showType ? Text(widget.type) : const SizedBox(),
          Padding(
            padding: EdgeInsets.only(top: widget.showType ? 4 : 0),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.pokemons.length,
                itemBuilder: (_, index) {
                  var item = widget.pokemons[index];
                  return CarouselCard(
                    index: index,
                    name: widget.name,
                    pokemon: item,
                    color: Colors.green,
                    homePageController: widget.homePageController,
                    indexSelectedContainer: indexSelectedContainer,
                    sizeSelectedContainer: sizeSelectedContainer,
                    itemFocusNode: itemFocusNode,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
