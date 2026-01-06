import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/menu/base_menu_item.dart';
import 'package:flwora/utils/constants/borders.dart';
import 'package:flwora/utils/constants/sizes.dart';

class TMenuDivider<T> implements BaseMenuItem<T> {
  @override
  PopupMenuEntry<T> build(BuildContext context) => PopupMenuItem<T>(
    enabled: false,
    height: Sizes.xs,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
      child: const Divider(height: 0.5),
    ),
  );
}

class TMenuListItem<T> implements BaseMenuItem<T> {
  // Set values untuk mengisi items dalam bentuk list
  final List<BaseMenuItem<T>> values;

  // Constructor
  TMenuListItem({required this.values});

  @override
  PopupMenuEntry<T> build(BuildContext context) => PopupMenuItem<T>(
    child: ClipRRect(
      borderRadius: TBorder.radius,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Sizes.menuWidth,
          maxHeight: Sizes.menuListHeight,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: values
                .map((e) => e.build(context))
                .toList(growable: false),
          ),
        ),
      ),
    ),
  );
}
