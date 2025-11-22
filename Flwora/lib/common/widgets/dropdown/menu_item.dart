import 'package:flutter/material.dart';

import 'base_menu_entry.dart';

// Menu item
class MenuItem<T> extends BaseMenuItem<T> {
  // Constructor
  MenuItem({required super.label, required super.onTap});

  @override
  PopupMenuEntry<T> build(BuildContext context) {
    // TODO: implement build
    return PopupMenuItem<T>(
      onTap: onTap,
      child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}

// Menu item dengan icon
class MenuItemWithIcon<T> extends BaseMenuItem<T> {
  final IconData icon;

  // Constructor
  MenuItemWithIcon({
    required super.label,
    required this.icon,
    required super.onTap,
  });

  @override
  PopupMenuEntry<T> build(BuildContext context) {
    // TODO: implement build
    return PopupMenuItem<T>(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Label
          Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(width: 15),
          // Icon
          Icon(icon, size: 20),
        ],
      ),
    );
  }
}
