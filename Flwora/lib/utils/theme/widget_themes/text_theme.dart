import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  // Base text style
  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
  }) => GoogleFonts.poppins(
    color: TColors.textPrimary,
    fontWeight: fontWeight,
    fontSize: fontSize,
    height: height ?? 1.5,
    letterSpacing: 0.5,
  );

  // Heading
  static final TextStyle headingLarge = _base(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle headingMedium = _base(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle headingSmall = _base(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  // Title
  static final TextStyle title = _base(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Body
  static final TextStyle body = _base(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Caption
  static final TextStyle caption = _base(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // Overline
  static final TextStyle overline = _base(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}

extension TextFormattersExtension on String {
  String excerpt(int maxLength) {
    if (length <= maxLength) return this;
    return "${substring(0, maxLength)}...";
  }
}
