import 'package:flutter/material.dart';

abstract class BaseMenuItem<T> {
  PopupMenuEntry<T> build(BuildContext context);
}
