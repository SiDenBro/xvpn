import 'package:flutter/material.dart';

class XColors {
  XColors._();

  // [ Light Theme Colors ]
  // [ Common ]
  static const Color primary = Color(0xFF97C171);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const double secondaryTextOpacity = 0.4;
  static const Color iconSecondaryColor = Colors.black;
  static const Color borderColor = Color(0xFF1A1B20);
  static const Color cardColor = Color(0xFF22262C);
  static const Color primaryTextColor = Color(0xFFAAB1BD);
  static const Color premiumColor = Color(0xFFC1AC71);

  // [ Background ]
  static const Gradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF2A2E36),
      Color(0xFF2A2E36),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // [ Buttons ]
  static const Gradient primaryButtonGradient = LinearGradient(
    colors: [
      Color(0xFFDE93F2),
      Color(0xFFB19DFF),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // [ Text Fields ]
  static const Color textFieldFillColor = Color(0xFFFFFFFF);
  static const Color textFieldBorderSideColor = Color(0xFF000000);
  static const Color textFieldUnselectedShadow = Color(0xFFD4E8FF);
}
