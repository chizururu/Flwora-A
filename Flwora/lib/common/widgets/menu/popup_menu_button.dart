import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/menu/base_menu_item.dart';
import 'package:flwora/utils/constants/borders.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';

class TPopupMenuButton<T> extends StatelessWidget {
  // Set items sebagai list konten atau widget menu
  // Jenis item yang dapat dipakai seperti menu item, divider, dan lain-lain
  final List<BaseMenuItem<T>> items;

  // Widget trigger untuk menampilkan menu yang berupa icon button dan widget lain yang disentuh
  final Widget trigger;

  // Atur posisi menu yang akan ditampilkan
  final PopupMenuPosition position;

  final double maxWidth;
  final double maxHeight;

  const TPopupMenuButton({
    super.key,
    required this.items,
    required this.trigger,
    this.position = PopupMenuPosition.under,
    this.maxWidth = Sizes.menuWidth,
    this.maxHeight = Sizes.menuHeight,
  });

  void showMenu(BuildContext context) {
    final renderObject = context.findRenderObject();
    final overlayState = Overlay.of(context);

    if (renderObject is! RenderBox) return;

    final overlayRenderObject = overlayState.context.findRenderObject();
    if (overlayRenderObject is! RenderBox) return;

    final buttonBox = renderObject;
    final overlayBox = overlayRenderObject;

    // Hitung posisi dan ukuran trigger dan overlay
    final buttonOffset = buttonBox.localToGlobal(
      Offset.zero,
      ancestor: overlayBox,
    );
    final buttonSize = buttonBox.size;
    final overlaySize = overlayBox.size;

    // Menentukan posisi menu align kanan atau kiri
    final alignRight = buttonOffset.dx > overlaySize.width / 2;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      // barrierColor: TColors.barrier,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        final top = position == PopupMenuPosition.under
            ? buttonOffset.dy + buttonSize.height
            : buttonOffset.dy;
        return Stack(
          children: [
            Positioned(
              top: top,
              left: alignRight ? null : buttonOffset.dx,
              right: alignRight
                  ? overlaySize.width - (buttonOffset.dx + buttonSize.width)
                  : null,
              child: buildMenuContent(context),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final alignment = position == PopupMenuPosition.under
            ? (alignRight ? Alignment.topRight : Alignment.topLeft)
            : (alignRight ? Alignment.bottomRight : Alignment.bottomLeft);
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            alignment: alignment,
            scale: Tween(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
        );
      },
    );
  }

  // Konten utama menu
  Widget buildMenuContent(BuildContext context) {
    final entries = items.map((e) => e.build(context)).toList(growable: false);

    return Material(
      color: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      // borderRadius: TBorders.radius,
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: entries,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => showMenu(context),
            child: trigger,
          ),
        );
      },
    );
  }
}
