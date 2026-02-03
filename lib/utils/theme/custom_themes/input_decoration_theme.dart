import 'package:xvpn/utils/constants/colors.dart';
import 'package:xvpn/utils/constants/sizes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class XInputDecorationTheme {
  XInputDecorationTheme._();

  static InputDecorationTheme mainTextTheme = InputDecorationTheme(
    labelStyle: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: XColors.black.withOpacity(XColors.secondaryTextOpacity),
    ),
    hintStyle: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: XColors.black.withOpacity(XColors.secondaryTextOpacity),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(XSizes.textFieldBorderRadius),
      borderSide: BorderSide(color: Color(0xFFE3E3E3), width: 0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(XSizes.textFieldBorderRadius),
      borderSide: BorderSide(color: Color(0xFFE3E3E3), width: 0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(XSizes.textFieldBorderRadius),
      borderSide: BorderSide(
          color: XColors.primary, width: XSizes.textFieldBorderWidth),
    ),
    filled: true,
    fillColor: XColors.textFieldFillColor,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    ),
  );
}
