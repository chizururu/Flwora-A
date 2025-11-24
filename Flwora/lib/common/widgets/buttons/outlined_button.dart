import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';

class TOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDestructive;

  const TOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  }) : isDestructive = false;

  const TOutlinedButton.destructive({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  }) : isDestructive = true;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: isDestructive
          ? OutlinedButton.styleFrom(foregroundColor: TColors.flagRed)
          : Theme.of(context).outlinedButtonTheme.style,
      onPressed: isLoading ? null : onPressed,
      child: Text(text, textAlign: TextAlign.justify),
    );
  }
}
