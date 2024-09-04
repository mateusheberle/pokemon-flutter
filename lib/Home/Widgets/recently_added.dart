import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Common/Model/pokemon.dart';
import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Controller/home_controller.dart';
import 'package:ebac_flutter/Home/Page/pokemon_detail.dart';
import 'package:ebac_flutter/Home/Shared/imagem_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({
    super.key,
    required this.tag,
    required this.type,
    required this.showType,
    required this.pokemons,
    required this.homePageController,
  });

  final String tag;
  final String type;
  final bool showType;
  final List<Pokemon> pokemons;
  final HomePageController homePageController;

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  ValueNotifier<int> initialPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    // print('recently: ' + widget.tag);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: widget.tag,
          child: ValueListenableBuilder(
            valueListenable: initialPage,
            builder: (context, value, child) => PageStorage(
              bucket: PageStorageBucket(),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  aspectRatio: AppStyle.aspectRatio,
                  viewportFraction: AppStyle.viewportFraction,
                  initialPage: initialPage.value,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: AppStyle.autoPlayInterval,
                  autoPlayAnimationDuration: AppStyle.autoPlayAnimationDuration,
                  autoPlayCurve: AppStyle.autoPlayCurve,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: widget.pokemons.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Material(
                        color: AppStyle.mainBackground,
                        child: InkWell(
                          onTap: () {
                            Future.delayed(const Duration(milliseconds: 700));
                            initialPage.value = widget.pokemons.indexOf(item);
                            final result = Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 1000),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder: (_, __, ___) => PokemonDetail(
                                  pokemon: item,
                                ),
                                settings: RouteSettings(
                                  arguments: Arguments(
                                    tag: widget.tag,
                                    homePageController:
                                        widget.homePageController,
                                    pokemon: item,
                                  ),
                                ),
                              ),
                            );

                            if (kDebugMode) {
                              print(result);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration:
                                const BoxDecoration(color: Colors.greenAccent),
                            child: Container(
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(AppStyle.roundAllCorners),
                                ),
                                child: Stack(
                                  children: [
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
                                        child: ImageNetwork(
                                          url: item.sprites!,
                                          fit: BoxFit.fitHeight,
                                          height: 150,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
