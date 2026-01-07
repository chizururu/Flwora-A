import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/cards/card.dart';
import 'package:flwora/features/device/controllers/create_device_controller.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class RequestPermissionBanner extends StatelessWidget {
  const RequestPermissionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateDeviceController>();

    return TCard(
      padding: EdgeInsets.symmetric(horizontal: Sizes.xl, vertical: Sizes.xl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "Aktifkan Bluetooth dan GPS agar perangkat di sekitar dapat ditemukan.",
              style: TTextTheme.overline.copyWith(color: Color(0xFF4895ef)),
              textAlign: TextAlign.justify,
              softWrap: true,
            ),
          ),

          SizedBox(width: Sizes.sm),

          Icon(Icons.keyboard_arrow_right_outlined, color: Color(0xFF4895ef)),
        ],
      ),
    );
  }
}
