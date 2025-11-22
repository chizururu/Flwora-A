import 'package:flutter/material.dart';

// Item dasar untuk popup menu item
abstract class BaseMenuEntry<T> {
  PopupMenuEntry<T> build(BuildContext context);
}

// Abstract class yang mewarisi dua jenis menu item
abstract class BaseMenuItem<T> extends BaseMenuEntry<T> {
  final String label;
  final VoidCallback? onTap;

  BaseMenuItem({required this.label, required this.onTap});
}