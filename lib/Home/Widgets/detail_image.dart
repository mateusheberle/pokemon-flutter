import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:flutter/material.dart';

import '../../Common/Model/arguments.dart';
import 'detail_base_image.dart';
import 'detail_information.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({
    super.key,
    required this.arguments,
    required this.crossFade,
  });

  final Arguments arguments;
  final ValueNotifier<bool> crossFade;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: AppStyle.mainBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DetailBaseImage(
                  arguments: arguments,
                  crossFade: crossFade,
                ),
                DetailInformation(arguments: arguments)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
