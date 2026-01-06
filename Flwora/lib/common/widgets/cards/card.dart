import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/borders.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';

class TCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final ShapeBorder? shapeBorder;

  const TCard({
    super.key,
    required this.child,
    this.margin,
    this.padding = const EdgeInsets.all(Sizes.sm),
    this.shapeBorder,
    this.backgroundColor = TColors.surfaceAlt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape:
            shapeBorder ??
            const RoundedRectangleBorder(borderRadius: TBorder.radius),
      ),
      child: child,
    );
  }
}
