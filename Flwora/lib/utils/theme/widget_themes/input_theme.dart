import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/borders.dart';

class TInputTheme {
  TInputTheme._();

  static final InputDecorationTheme data = InputDecorationTheme(
    isDense: true,
    border: TBorder.input,
    focusedBorder: TBorder.inputFocused,
    errorBorder: TBorder.inputError,
    focusedErrorBorder: TBorder.inputFocusedError,
  );
}
