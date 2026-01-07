import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/menu/base_menu_item.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class TMenuItem<T> implements BaseMenuItem<T> {
  // Set title untuk nama item
  final String title;

  // Set icon
  final IconData? icon;

  // Callback ketika menu item ditekan
  final VoidCallback onPressed;

  // TextStyle
  final TextStyle? textStyle;

  // Set ukuran icon
  final double? iconSize;

  const TMenuItem({
    required this.title,
    this.icon,
    required this.onPressed,
    this.textStyle,
    this.iconSize,
  });

  @override
  PopupMenuEntry<T> build(BuildContext context) => PopupMenuItem<T>(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.sm),
      child: Row(
        mainAxisAlignment: icon != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title menu item
          Expanded(
            child: Text(
              title,
              style:
                  textStyle ??
                  TTextTheme.caption.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Icon menu item (Jika tidak kosong)
          if (icon != null) ...[
            // Jarak antara text dan icon dalam menu item
            const SizedBox(width: Sizes.spaceMd),
            // Icon menu item
            Icon(icon, size: iconSize ?? Sizes.md),
          ],
        ],
      ),
    ),
  );
}
