import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/dropdown/base_menu_entry.dart';
import 'package:flwora/utils/constants/colors.dart';

class TDropdownMenu<T> extends StatelessWidget {
  final List<BaseMenuEntry<T>> items;
  final Icon icon;
  final PopupMenuPosition position;

  const TDropdownMenu({
    super.key,
    required this.items,
    required this.icon,
    this.position = PopupMenuPosition.under,
  });

  void _showMenu(BuildContext buttonContext) {
    final RenderBox buttonBox = buttonContext.findRenderObject() as RenderBox;
    final RenderBox overlayBox =
        Overlay.of(buttonContext).context.findRenderObject() as RenderBox;

    final Offset buttonOffset = buttonBox.localToGlobal(
      Offset.zero,
      ancestor: overlayBox,
    );
    final Size buttonSize = buttonBox.size;
    final Size overlaySize = overlayBox.size;

    final bool alignRight = buttonOffset.dx > overlaySize.width / 2;

    showGeneralDialog<T>(
      context: buttonContext,
      barrierDismissible: true,
      barrierLabel: 'Menu',
      barrierColor: TColors.barrier,
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        final double top = position == PopupMenuPosition.under
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
              child: Material(
                color: Colors.transparent,
                child: _buildMenuContent(context),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final Alignment alignment;
        if (position == PopupMenuPosition.under) {
          alignment = alignRight ? Alignment.topRight : Alignment.topLeft;
        } else {
          alignment = alignRight ? Alignment.bottomRight : Alignment.bottomLeft;
        }

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            alignment: alignment,
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildMenuContent(BuildContext context) {
    final entries = items.map((e) => e.build(context)).toList();

    return Material(
      color: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 120, maxHeight: 500),
        child: IntrinsicWidth(
          child: Column(mainAxisSize: MainAxisSize.min, children: entries),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (buttonContext) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => _showMenu(buttonContext),
          child: icon,
        );
      },
    );
  }
}
