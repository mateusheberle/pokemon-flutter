import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Widgets/custom_carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Controller/home_controller.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({
    super.key,
    required this.homePageController,
  });

  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: homePageController.recentlyAdded.value.isNotEmpty ? 180 : 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: Center(
          child: ValueListenableBuilder<List<CustomCarouselSlider>>(
            valueListenable: homePageController.customCarouselSliders,
            builder: (context, value, child) {
              return Stack(
                children: [
                  Container(
                    color: AppStyle.mainBackground,
                    height: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          homePageController.customCarouselSliders.value.length,
                      itemBuilder: (_, index) {
                        var items = homePageController
                            .customCarouselSliders.value[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: CustomCarouselSlider(
                            name: items.name,
                            type: items.type,
                            initialPage: items.initialPage,
                            pokemons: items.pokemons,
                            showType: true,
                            homePageController: homePageController,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
