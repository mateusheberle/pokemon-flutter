import 'package:ebac_flutter/Home/Controller/home_page_repository.dart';
import 'package:flutter/material.dart';

import '../Controller/home_controller.dart';

class CustomRefresh extends StatelessWidget {
  const CustomRefresh({
    super.key,
    required this.homePageController,
    required this.repository,
  });

  final HomePageController homePageController;
  final HomePageRepository repository;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: homePageController.isRefreshCustomOn,
          builder: (context, value, child) {
            return homePageController.isRefreshCustomOn.value
                ? ValueListenableBuilder<int>(
                    valueListenable: repository.porcentagem,
                    builder: (context, value, child) {
                      return Text(
                        '$value%',
                        style: const TextStyle(fontSize: 20),
                      );
                    },
                  )
                : const SizedBox();
          },
        ),
      ),
    );
  }
}
