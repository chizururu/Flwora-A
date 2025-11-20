import 'package:flutter/material.dart';

class TAppbar extends StatelessWidget {
  final String? title;
  final bool hasBackButton;
  final IconData? leadingIcon;
  final IconData? actionIcon;
  final List<Widget>? leading;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onActionPressed;
  final double? leadingWidth;

  // Bottom widget
  final PreferredSizeWidget? bottom;

  // Widget pinned
  final bool centerTitle;
  final bool isPinned;
  final bool floating;

  const TAppbar({
    super.key,
    this.title,
    this.hasBackButton = false,
    this.leadingIcon,
    this.actionIcon,
    this.leading,
    this.actions,
    this.onLeadingPressed,
    this.onActionPressed,
    this.leadingWidth,
    this.bottom,
    this.centerTitle = true,
    this.isPinned = false,
    this.floating = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: (title != null && title!.isNotEmpty) ? Text(title!) : null,
      centerTitle: centerTitle,
      leading: hasBackButton
          ? IconButton(
              onPressed:
                  onLeadingPressed ?? () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back_ios_outlined),
            )
          : leadingIcon != null
          ? IconButton(onPressed: onLeadingPressed, icon: Icon(leadingIcon))
          : (leading != null && leading!.isNotEmpty)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: leading!,
            )
          : null,
      actions: (actions != null && actions!.isNotEmpty)
          ? actions
          : actions != null
          ? [IconButton(onPressed: onActionPressed, icon: Icon(actionIcon))]
          : null,
      leadingWidth: leadingWidth,
      bottom: bottom,
      pinned: isPinned,
      floating: floating,
    );
  }
}
