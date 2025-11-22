import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class AuthRedirect extends StatelessWidget {
  final String message;
  final String actionLabel;
  final VoidCallback onNav;

  const AuthRedirect({
    super.key,
    required this.message,
    required this.actionLabel,
    required this.onNav,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(message, style: TTextStyle.caption),
        GestureDetector(
          onTap: onNav,
          child: Text(
            actionLabel,
            style: TTextStyle.caption.colors(TColors.granite),
          ),
        ),
      ],
    );
  }
}
