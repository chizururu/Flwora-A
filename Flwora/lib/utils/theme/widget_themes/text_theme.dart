import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextStyle {
  // Constructor
  TTextStyle._();

  // Heading
  static final headingLarge = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.5,
    letterSpacing: 0.5,
    color: TColors.textPrimary,
  );

  static final headingMedium = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.5,
    letterSpacing: 0.5,
    color: TColors.textPrimary,
  );

  static final headingSmall = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.5,
    letterSpacing: 0.5,
    color: TColors.textPrimary,
  );

  // Title
  static final title = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0.5,
    color: TColors.textPrimary,
  );

  // Body
  static final body = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.5,
    color: TColors.textPrimary,
  );

  // Caption
  static final caption = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.5,
    color: TColors.textPrimary,
  );

  // Overline
  static final overline = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    letterSpacing: 0.5,
    color: TColors.textPrimary,
  );
}

extension TextExtension on TextStyle {
  // Warna teks
  TextStyle colors(Color c) => copyWith(color: c);

  // Jarak antar huruf
  TextStyle spaced(double s) => copyWith(letterSpacing: s);

  // Tinggi baris
  TextStyle lineHeight(double h) => copyWith(height: h);

  // Weight
  TextStyle weight(FontWeight w) => copyWith(fontWeight: w);
}

extension TextFormattersExtension on String {
  String excerpt(int maxLength) {
    if (length <= maxLength) return this;
    return "${substring(0, maxLength)}...";
  }
}
