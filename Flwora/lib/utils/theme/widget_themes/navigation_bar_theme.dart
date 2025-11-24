import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class TNavigationBarTheme {
  // Constructor
  TNavigationBarTheme._();

  static BottomNavigationBarThemeData bottomNavData =
      BottomNavigationBarThemeData(
        selectedLabelStyle: TTextStyle.caption.weight(FontWeight.w500).colors(TColors.granite),
        selectedItemColor: TColors.granite,
        selectedIconTheme: IconThemeData(size: 18),
        unselectedLabelStyle: TTextStyle.caption.colors(TColors.black40),
        unselectedItemColor: TColors.black40,
        unselectedIconTheme: IconThemeData(size: 18),
        backgroundColor: TColors.white,
      );
}
