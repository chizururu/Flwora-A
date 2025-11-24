import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/border.dart';
import 'package:flwora/utils/constants/colors.dart';

class ModalBottom extends StatelessWidget {
  final Widget child;

  const ModalBottom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          borderRadius: TBorders.radius,
          color: TColors.white,
        ),
        child: child,
      ),
    );
  }
}
