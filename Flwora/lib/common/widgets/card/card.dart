import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';

class TCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double elevation;
  final ShapeBorder? shape;

  const TCard({
    super.key,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(8.0),
    this.color = TColors.whiteSmoke,
    this.elevation = 0.25,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: color,
      shape: shape,
      elevation: elevation,
      child: Padding(padding: padding, child: child),
    );
  }
}
