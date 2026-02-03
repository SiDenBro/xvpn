import 'package:flutter/material.dart';

class XExtension extends ThemeExtension<XExtension> {
  final Gradient? backgroundGradient;
  final Gradient? primaryButtonGradient;
  final TextStyle? primaryButtonTextStyle;
  final Color? iconSecondaryColor;

  const XExtension({
    required this.backgroundGradient,
    required this.primaryButtonGradient,
    required this.primaryButtonTextStyle,
    required this.iconSecondaryColor,
  });

  @override
  ThemeExtension<XExtension> copyWith({
    Gradient? backgroundGradient,
    Gradient? primaryButtonGradient,
    TextStyle? primaryButtonTextStyle,
    Color? iconSecondaryColor,
  }) {
    return XExtension(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      primaryButtonGradient:
          primaryButtonGradient ?? this.primaryButtonGradient,
      primaryButtonTextStyle:
          primaryButtonTextStyle ?? this.primaryButtonTextStyle,
      iconSecondaryColor: iconSecondaryColor ?? this.iconSecondaryColor,
    );
  }

  @override
  ThemeExtension<XExtension> lerp(
    ThemeExtension<XExtension>? other,
    double t,
  ) {
    if (other is! XExtension) {
      return this;
    }

    return XExtension(
      backgroundGradient:
          Gradient.lerp(backgroundGradient, other.backgroundGradient, t),
      primaryButtonGradient:
          Gradient.lerp(primaryButtonGradient, other.primaryButtonGradient, t),
      primaryButtonTextStyle: TextStyle.lerp(
          primaryButtonTextStyle, other.primaryButtonTextStyle, t),
      iconSecondaryColor:
          Color.lerp(iconSecondaryColor, other.iconSecondaryColor, t),
    );
  }
}
