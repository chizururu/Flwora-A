import 'package:flutter/material.dart';

class TButtonTheme {
  TButtonTheme._();

  static final ElevatedButtonThemeData elevated = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(elevation: 0),
  );

  static final OutlinedButtonThemeData outlined = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(elevation: 0),
  );
}
