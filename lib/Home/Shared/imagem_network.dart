import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({
    super.key,
    required this.url,
    required this.fit,
    this.height,
    this.width,
  });

  final String url;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    List<String> lastPart = (url).split('.');
    if (lastPart.last == 'svg') {
      return SvgPicture.network(
        url,
        fit: fit,
        height: height ?? 100,
        width: width ?? 100,
      );
    } else {
      return Image.network(
        url,
        fit: fit,
        height: height ?? 100,
        width: width ?? 100,
      );
    }
  }
}
