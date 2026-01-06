import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/cards/card.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class DeviceDiscoveryIndicator extends StatelessWidget {
  const DeviceDiscoveryIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return TCard(
      padding: EdgeInsets.symmetric(horizontal: Sizes.xl, vertical: Sizes.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Heading
          Text("Mencari perangkat di sekitar kamu...", style: TTextTheme.body),

          SizedBox(height: Sizes.xl),

          // Searching Animation
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset(
              'assets/icons/system-regular-716-spinner-three-dots-loop-line.gif',
            ),
          ),

          SizedBox(height: Sizes.xl),

          // Sub heading
          Text(
            "Dekatkan ponsel ke perangkat yang ingin dihubungkan supaya lebih cepat ditemukan dan siap digunakan",
            style: TTextTheme.overline.copyWith(color: TColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
