import 'package:flutter/material.dart';

class TBorder {
  TBorder._();

  static const BorderRadius radius = BorderRadius.all(Radius.circular(10));

  static const OutlineInputBorder input = OutlineInputBorder(
    borderRadius: radius,
  );

  static const OutlineInputBorder inputFocused = OutlineInputBorder(
    borderRadius: radius,
  );

  static const OutlineInputBorder inputError = OutlineInputBorder(
    borderRadius: radius,
  );

  static const OutlineInputBorder inputFocusedError = OutlineInputBorder(
    borderRadius: radius,
  );
}
