import 'package:flutter/material.dart';
import 'package:flwora/utils/constants/border.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';

class SensorCardWidget extends StatelessWidget {
  final String label;
  final String value;
  final String unit;

  const SensorCardWidget({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      decoration: BoxDecoration(
        color: TColors.cardBackground,
        borderRadius: TBorders.radius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Label utama dari sensor
          Text(
            label,
            style: TTextStyle.body.colors(TColors.textPrimary40),
            textAlign: TextAlign.center,
          ),
          // Angka utama dari sensor
          Text(
            value,
            style: TTextStyle.title.weight(FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
