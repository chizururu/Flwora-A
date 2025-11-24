import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/border.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class TOutlinedButtonTheme {
  // Constructor
  TOutlinedButtonTheme._();

  static final OutlinedButtonThemeData data = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      backgroundColor: TColors.whiteSmoke,
      foregroundColor: TColors.carbonBlack,
      shape: RoundedRectangleBorder(borderRadius: TBorders.radius),
      side: BorderSide(color: TColors.whiteSmoke),
      textStyle: TTextStyle.body.weight(FontWeight.w700),
    ),
  );
}
