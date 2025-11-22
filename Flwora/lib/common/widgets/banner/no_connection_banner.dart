import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flwora/common/widgets/card/card.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TCard(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(
              BootstrapIcons.exclamation_octagon_fill,
              size: 18,
              color: TColors.flagRed,
            ),
            Text(
              "Tidak terdapat koneksi internet",
              style: TTextStyle.caption.colors(TColors.flagRed),
            ),
          ],
        ),
      ),
    );
  }
}
