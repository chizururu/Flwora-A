import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/layouts/grid_layout.dart';
import 'package:flwora/data/models/device.dart';
import 'package:flwora/features/device/screens/dashboard_device_screen.dart';
import 'package:flwora/features/home/widgets/device_grid_item.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class SectorDeviceGrid extends StatelessWidget {
  final List<Device> devices;

  const SectorDeviceGrid({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    final contentPadding = const EdgeInsets.symmetric(
      horizontal: Sizes.lg,
      vertical: Sizes.sm,
    );

    final emptyDeviceView = Text(
      "Tidak ada perangkat",
      style: TTextTheme.caption.copyWith(color: TColors.textSecondary),
      textAlign: TextAlign.center,
    );

    final deviceGridView = TGridView(
      itemCount: devices.length,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisExtent: 125,
      maxCrossAxisExtent: 200,
      itemBuilder: (_, i) => DeviceGridItem(
        device: devices[i],
        onTap: () => Get.to(() => DashboardDeviceScreen(device: devices[i])),
      ),
    );

    return Container(
      padding: contentPadding,
      child: devices.isEmpty ? emptyDeviceView : deviceGridView,
    );
  }
}
