import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class NoDeviceBanner extends StatelessWidget {
  const NoDeviceBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //   'assets/images/plant_design.png',
          //   fit: BoxFit.cover,
          //   width: 200,
          //   height: 100,
          // ),
          SizedBox(height: 30),
          Text(
            "Tidak Ada Perangkat",
            style: TTextStyle.caption.colors(TColors.textPrimary40),
          ),
        ],
      ),
    );
  }
}
