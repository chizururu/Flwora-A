import 'package:flutter/material.dart';
import 'package:flwora/utils/theme/widget_themes/appbar_theme.dart';
import 'package:flwora/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flwora/utils/theme/widget_themes/input_field_theme.dart';

class TAppTheme {
  // Constructor
  TAppTheme._();

  static final ThemeData data = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    inputDecorationTheme: TInputFieldTheme.inputTheme,
    appBarTheme: TAppBarTheme.data,
    elevatedButtonTheme: TElevatedButtonTheme.data,
  );
}
