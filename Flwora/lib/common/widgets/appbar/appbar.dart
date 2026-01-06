import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/sizes.dart';

class TAppBar extends StatelessWidget {
  // Set title yang menampilkan di AppBar.
  final String? title;

  // Set untuk tampil tombol back secara standar.
  final bool showBackButton;

  // Icon custom tunggal untuk leading.
  final IconData? leadingIcon;

  // Callback ketika leading tunggal atau back button ditekan.
  final VoidCallback? onLeadingTapped;

  // List widget dapat dibuat dalam leading.
  final List<Widget>? leading;

  // Leading utama dalam bentuk widget tanpa button.
  final Widget? leadingButton;

  // List widget yang dibuat dalam action.
  final List<Widget>? actions;

  // Action utama dapat dibuat bagian bawah AppBar.
  final Widget? actionButton;

  // Widget dapat dibuat bagian bawah AppBar.
  final PreferredSizeWidget? bottom;

  // Set lebar area leading yang dapat mencegah overflow saat buat banyak widget pada leading.
  final double? leadingWidth;

  // Atur behavior agar AppBar tetap tampil saat scroll.
  final bool pinned;

  // Atur behavior khusus TabBar wajib agar tutup leading, title, dan action tanpa mengorbankan TabBar.
  final bool floating;

  const TAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.leadingIcon,
    this.onLeadingTapped,
    this.leading,
    this.leadingButton,
    this.actions,
    this.actionButton,
    this.bottom,
    this.leadingWidth,
    this.pinned = false,
    this.floating = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: Sizes.lg),
        child: showBackButton
            ? GestureDetector(
                onTap:
                    onLeadingTapped ?? () => Navigator.of(context).maybePop(),
                behavior: HitTestBehavior.translucent,
                child: const Icon(Icons.arrow_back),
              )
            : leadingIcon != null
            ? GestureDetector(onTap: onLeadingTapped, child: Icon(leadingIcon))
            : (leading != null && leading!.isNotEmpty)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: leading!,
              )
            : (leadingButton != null)
            ? leadingButton
            : null,
      ),
      automaticallyImplyLeading: false,
      title: (title != null && title!.isNotEmpty) ? Text(title!) : null,
      actions: (actions != null && actions!.isNotEmpty)
          ? actions
          : actionButton != null
          ? [actionButton!]
          : null,
      bottom: bottom,
      pinned: pinned,
      floating: floating,
      leadingWidth: leadingWidth,
      actionsPadding: const EdgeInsets.only(right: Sizes.lg),
    );
  }
}
