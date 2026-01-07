import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';

class AiStatusIcon extends StatelessWidget {
  const AiStatusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      BootstrapIcons.stars,
      color: TColors.textGranite,
      size: Sizes.iconMd,
    );
  }
}
