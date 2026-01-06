import 'package:flutter/material.dart';
import 'package:flwora/utils/theme/widget_themes/appbar_theme.dart';
import 'package:flwora/utils/theme/widget_themes/button_theme.dart';
import 'package:flwora/utils/theme/widget_themes/input_theme.dart';
import 'package:flwora/utils/theme/widget_themes/navigation_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData data = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: TAppBarTheme.data,
    bottomNavigationBarTheme: TNavigationTheme.data,
    inputDecorationTheme: TInputTheme.data,
    elevatedButtonTheme: TButtonTheme.elevated,
    outlinedButtonTheme: TButtonTheme.outlined,
  );
}
