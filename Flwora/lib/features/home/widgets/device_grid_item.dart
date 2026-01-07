import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/cards/card.dart';
import 'package:flwora/common/widgets/icons/ai_status_icon.dart';
import 'package:flwora/data/models/device.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class DeviceGridItem extends StatelessWidget {
  final Device device;
  final VoidCallback onTap;

  const DeviceGridItem({super.key, required this.device, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!device.aiStatus) AiStatusIcon(),

            Text(
              device.name.excerpt(8),
              style: TTextTheme.caption.copyWith(fontWeight: FontWeight.w600),
            ),

            Text(
              device.status ? 'Online' : 'Offline',
              style: TTextTheme.overline.copyWith(
                color: device.status
                    ? TColors.textGranite
                    : TColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
