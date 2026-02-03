import 'package:xvpn/utils/theme/custom_themes/input_decoration_theme.dart';
import 'package:xvpn/utils/theme/custom_themes/text_styles.dart';
import 'package:xvpn/utils/theme/custom_themes/text_theme.dart';
import 'package:xvpn/utils/theme/custom_themes/extension.dart';
import 'package:xvpn/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class XAppTheme {
  XAppTheme._();

  static ThemeData mainTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inner',
    brightness: Brightness.dark,
    primaryColor: XColors.primary,
    scaffoldBackgroundColor: const Color(0xFF2A2E36),
    textTheme: XTextTheme.mainTextTheme,
    inputDecorationTheme: XInputDecorationTheme.mainTextTheme,
    extensions: const [
      XExtension(
        backgroundGradient: XColors.backgroundGradient,
        primaryButtonGradient: XColors.primaryButtonGradient,
        primaryButtonTextStyle: XTextStyles.mainPrimaryButtonTextStyle,
        iconSecondaryColor: Colors.black,
      ),
    ],
  );
}
