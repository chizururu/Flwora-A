import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/sizes.dart';

class TGridView extends StatelessWidget {
  // Tentukan jumlah item dalam grid
  final int itemCount;

  // Set builder untuk membuat setiap item dalam grid
  final Widget Function(BuildContext, int) itemBuilder;

  // Tentukan arah scroll pada grid
  final Axis scrollDirection;

  // Scroll physics
  final ScrollPhysics? physics;

  // Jarak antar item
  final double spacing;

  // Rasio ukuran item
  final double? childAspectRatio;

  // Jumlah kolom tetap
  final int? crossAxisCount;

  // Lebar maksimal tiap item
  final double? maxCrossAxisExtent;

  // Tinggi item tetap
  final double? mainAxisExtent;

  const TGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.spacing = Sizes.spaceSm,
    this.childAspectRatio,
    this.crossAxisCount,
    this.maxCrossAxisExtent,
    this.mainAxisExtent,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: crossAxisCount != null
          ? SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount!,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: childAspectRatio ?? 1,
      )
          : SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent!,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        mainAxisExtent: mainAxisExtent,
      ),
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      physics: physics,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
