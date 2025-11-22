import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/border.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class TInputFieldTheme {
  // Constructor
  TInputFieldTheme._();

  // Input theme
  static final InputDecorationTheme inputTheme = InputDecorationTheme(
    labelStyle: TTextStyle.body,
    errorStyle: TTextStyle.caption.colors(TColors.flagRed),
    isDense: true,
    border: TBorders.base,
    focusedBorder: TBorders.focused,
    errorBorder: TBorders.error,
    focusedErrorBorder: TBorders.focusedError,
  );
}
