import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();
}

extension TextFormattersExtension on String {
  String excerpt(int maxLength) {
    if (length <= maxLength) return this;
    return "${substring(0, maxLength)}...";
  }
}
