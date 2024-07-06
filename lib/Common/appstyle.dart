import 'package:flutter/material.dart';

class AppStyle {
  static const Color mainColor = Colors.white;
  static const Color primarySwatch = Colors.green;
  static const Color mainBackground = Color(0xFF0B0B0E);
  static const Color mainBackgroundContrast54 = Color(0x8A000000);
  static const Color mainBackgroundContrast12 = Color(0x1F000000);
  static const Color barBackgroundColor = Color(0xFF101010);

  // Slider Settings
  static const int initialPage = 0;
  static const double roundAllCorners = 4;
  static const double aspectRatio = 16 / 9;
  static const double viewportFraction = 0.8;
  static const Curve autoPlayCurve = Curves.easeInBack;
  static const Duration autoPlayInterval = Duration(seconds: 3);
  static const Duration autoPlayAnimationDuration = Duration(milliseconds: 800);
}
