import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/borders.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class TInputTheme {
  TInputTheme._();

  static final InputDecorationTheme data = InputDecorationTheme(
    labelStyle: TTextTheme.body,
    errorStyle: TTextTheme.caption.copyWith(color: TColors.textDanger),
    isDense: true,
    border: TBorder.input,
    focusedBorder: TBorder.inputFocused,
    errorBorder: TBorder.inputError,
    focusedErrorBorder: TBorder.inputFocusedError,
  );
}
