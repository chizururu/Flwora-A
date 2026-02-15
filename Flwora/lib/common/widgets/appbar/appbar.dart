import 'package:flutter/material.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Set title yang ditampilkan di AppBar
  final String? title;

  // Set untuk menampilkan tombol back standar
  final bool showBackButton;

  // Icon custom tunggal untuk leading
  final IconData? leadingIcon;

  // Callback ketika leading tunggal atau back button ditekan
  final VoidCallback? onLeadingTapped;

  // Leading utama dalam bentuk widget tanpa button
  final Widget? leading;

  // List widget yang dibuat dalam actions
  final List<Widget>? actions;

  // Action utama dalam bentuk widget tanpa button
  final Widget? actionButton;

  // Widget dapat dibuat bagian bawah AppBar
  final PreferredSizeWidget? bottom;

  // Set lebar area leading yang dapat mencegah overflow saat membuat banyak widget
  final double? leadingWidth;

  const TAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.leadingIcon,
    this.onLeadingTapped,
    this.leading,
    this.actions,
    this.actionButton,
    this.bottom,
    this.leadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (leading != null)
          ? leading
          : (showBackButton || leadingIcon != null)
          ? IconButton(
              onPressed:
                  onLeadingTapped ?? () => Navigator.of(context).maybePop(),
              icon: Icon(leadingIcon ?? Icons.arrow_back),
            )
          : null,
      automaticallyImplyLeading: false,
      title: (title != null && title!.isNotEmpty) ? Text(title!) : null,
      actions: (actions != null && actions!.isNotEmpty)
          ? actions
          : actionButton != null
          ? [actionButton!]
          : null,
      leadingWidth: leadingWidth,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
