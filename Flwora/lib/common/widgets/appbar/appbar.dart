import 'package:flutter/material.dart';

class TAppbar extends StatelessWidget {
  final String? title;
  final bool hasBackButton;
  final IconData? leadingIcon;
  final IconData? actionIcon;
  final Color? actionIconColor;
  final List<Widget>? leading;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onActionPressed;
  final double? leadingWidth;

  // Bottom widget
  final PreferredSizeWidget? bottom;

  // Widget pinned
  final bool centerTitle;
  final bool pinned;
  final bool floating;

  const TAppbar({
    super.key,
    this.title,
    this.hasBackButton = false,
    this.leadingIcon,
    this.actionIcon,
    this.actionIconColor,
    this.leading,
    this.actions,
    this.onLeadingPressed,
    this.onActionPressed,
    this.leadingWidth,
    this.bottom,
    this.centerTitle = true,
    this.pinned = false,
    this.floating = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: (title != null && title!.isNotEmpty) ? Text(title!) : null,
      centerTitle: centerTitle,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: hasBackButton
            ? GestureDetector(
                onTap:
                    onLeadingPressed ?? () => Navigator.of(context).maybePop(),
                behavior: HitTestBehavior.translucent,
                child: const Icon(Icons.arrow_back),
              )
            : leadingIcon != null
            ? GestureDetector(
                onTap: onLeadingPressed,
                behavior: HitTestBehavior.translucent,
                child: Icon(leadingIcon),
              )
            : (leading != null && leading!.isNotEmpty)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: leading!,
              )
            : null,
      ),
      actions: (actions != null && actions!.isNotEmpty)
          ? actions
          : actionIcon != null
          ? [
              GestureDetector(
                onTap: onActionPressed,
                behavior: HitTestBehavior.translucent,
                child: Icon(actionIcon, color: actionIconColor),
              ),
            ]
          : null,
      leadingWidth: leadingWidth,
      automaticallyImplyLeading: false,
      actionsPadding: const EdgeInsets.only(right: 16),
      bottom: bottom,
      pinned: pinned,
      floating: floating,
    );
  }
}
