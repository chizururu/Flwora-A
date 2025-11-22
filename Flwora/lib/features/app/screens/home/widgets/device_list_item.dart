import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/card/card.dart';
import 'package:flwora/data/models/device.dart';
import 'package:flwora/utils/constants/border.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class DeviceListItem extends StatelessWidget {
  final Device device;
  final VoidCallback onPressed;

  const DeviceListItem({
    super.key,
    required this.device,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TCard(
        color: TColors.whiteSmoke,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: TColors.border),
          borderRadius: TBorders.radius,
        ),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(
                'assets/images/machine.png',
                fit: BoxFit.contain, // supaya tidak kepotong
              ),
            ),
            SizedBox(height: 20),
            Text(
              device.name.excerpt(12),
              style: TTextStyle.caption.weight(FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                device.status
                    ? Text(
                        'Online',
                        style: TTextStyle.overline.colors(TColors.granite),
                      )
                    : Text(
                        'Offline',
                        style: TTextStyle.overline.colors(
                          TColors.textPrimary40,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
