import 'package:flutter/material.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static final AppBarTheme data = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white,
    titleTextStyle: TTextTheme.title,
  );
}
