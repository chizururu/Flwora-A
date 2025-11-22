import 'package:flutter/material.dart';

import '../../constants/border.dart';
import '../../constants/colors.dart';
import 'text_theme.dart';

class TElevatedButtonTheme {
  // Constructor
  TElevatedButtonTheme._();

  static final ElevatedButtonThemeData data = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.granite,
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      shape: RoundedRectangleBorder(borderRadius: TBorders.radius),
      textStyle: TTextStyle.body.weight(FontWeight.w700),
      disabledForegroundColor: TColors.granite,
      disabledBackgroundColor: TColors.whiteSmoke,
    ),
  );
}
