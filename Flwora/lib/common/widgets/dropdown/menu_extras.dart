import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/dropdown/base_menu_entry.dart';

class MenuDivider<T> extends BaseMenuEntry<T> {
  @override
  PopupMenuEntry<T> build(BuildContext context) =>
      const PopupMenuDivider(height: 10);
}

class MenuListScrollable<T> extends BaseMenuEntry<T> {
  final List<PopupMenuEntry<T>> values;
  final double maxWidth;
  final double maxHeight;

  MenuListScrollable({
    required this.values,
    this.maxWidth = 280,
    this.maxHeight = 250,
  });

  @override
  PopupMenuEntry<T> build(BuildContext context) {
    return PopupMenuItem<T>(
      enabled: false,
      padding: EdgeInsets.zero,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(mainAxisSize: MainAxisSize.min, children: values),
        ),
      ),
    );
  }
}
