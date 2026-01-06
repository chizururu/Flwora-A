import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/cards/card.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class DeviceDiscoveryUnavailable extends StatelessWidget {
  const DeviceDiscoveryUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    return TCard(
      padding: EdgeInsets.symmetric(horizontal: Sizes.xl, vertical: Sizes.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Anda tidak dapat melanjutkan proses penambahan perangkat. Pastikan Bluetooth dan GPS diaktifkan secara bersamaan.",
            style: TTextTheme.caption.copyWith(color: TColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
