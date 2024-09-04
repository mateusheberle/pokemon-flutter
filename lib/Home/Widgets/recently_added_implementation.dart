import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Controller/home_controller.dart';
import 'package:ebac_flutter/Home/Widgets/custom_carousel_slider.dart';
import 'package:ebac_flutter/Home/Widgets/recently_added.dart';
import 'package:flutter/material.dart';

class RecentlyAddedImplementation extends StatelessWidget {
  const RecentlyAddedImplementation({
    super.key,
    required this.homePageController,
  });

  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    // Positioned.fill - ocupa todo espaço disponível dentro do Stack
    return Positioned.fill(
      top: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: AppStyle.mainBackground,
          child: ValueListenableBuilder<List<CustomCarouselSlider>>(
            valueListenable: homePageController.recentlyAdded,
            builder: (context, value, child) {
              return homePageController.recentlyAdded.value.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: RecentlyAdded(
                        tag: homePageController.generateTag(),
                        homePageController: homePageController,
                        type: homePageController.recentlyAdded.value[0].type,
                        // initialPage: homePageController.recentlyAdded.value[0].initialPage,
                        pokemons:
                            homePageController.recentlyAdded.value[0].pokemons,
                        showType: true,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    );
            },
          ),
        ),
      ),
    );
  }
}
