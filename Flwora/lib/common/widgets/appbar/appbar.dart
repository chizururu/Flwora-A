import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TAppbar extends StatelessWidget {
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

  const TAppbar({
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
      automaticallyImplyLeading: false,
      bottom: bottom,
      pinned: pinned,
      floating: floating,
      leadingWidth: leadingWidth,
      actionsPadding: const EdgeInsets.only(right: 16),
    );
  }
}
