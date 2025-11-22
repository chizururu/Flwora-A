import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class TAppBarTheme {
  // Constructor
  TAppBarTheme._();

  static final AppBarTheme data = AppBarTheme(
    elevation: 1,
    titleTextStyle: TTextStyle.title,
    backgroundColor: Colors.white,
    surfaceTintColor: TColors.whiteSmoke,
  );
}
