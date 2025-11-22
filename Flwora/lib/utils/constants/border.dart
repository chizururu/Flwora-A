import 'package:flutter/material.dart';

import 'colors.dart';

class TBorders {
  // Constructor
  TBorders._();

  // Radius
  static const BorderRadius radius = BorderRadius.all(Radius.circular(10));

  // Input border base only radius
  static const OutlineInputBorder base = OutlineInputBorder(
    borderRadius: radius,
    borderSide: BorderSide(color: TColors.carbonBlack),
  );

  // Input border focus
  static const OutlineInputBorder focused = OutlineInputBorder(
    borderRadius: radius,
    borderSide: BorderSide(color: TColors.whiteSmoke),
  );

  // Input border error
  static final OutlineInputBorder error = OutlineInputBorder(
    borderRadius: radius,
    borderSide: BorderSide(color: TColors.flagRed),
  );

  // Input border focus error
  static final OutlineInputBorder focusedError = OutlineInputBorder(
    borderRadius: radius,
    borderSide: BorderSide(color: TColors.flagRed),
  );
}
