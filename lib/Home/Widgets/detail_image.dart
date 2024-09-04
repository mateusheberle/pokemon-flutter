import 'package:ebac_flutter/Common/Model/arguments.dart';
import 'package:ebac_flutter/Common/appstyle.dart';
import 'package:ebac_flutter/Home/Widgets/detail_base_image.dart';
import 'package:ebac_flutter/Home/Widgets/detail_information.dart';
import 'package:flutter/material.dart';

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
                DetailInformation(arguments: arguments),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
