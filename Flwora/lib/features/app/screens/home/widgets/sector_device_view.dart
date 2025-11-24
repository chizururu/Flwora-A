import 'package:flutter/material.dart';
import 'package:flwora/data/models/device.dart';
import 'package:flwora/features/app/screens/home/widgets/device_list_item.dart';
import 'package:flwora/features/app/screens/home/widgets/no_device_banner.dart';
import 'package:flwora/features/device/screens/device_detail/device_detail_screen.dart';
import 'package:get/get.dart';

class SectorDeviceView extends StatelessWidget {
  final List<Device> devices;

  const SectorDeviceView({super.key, required this.devices});

  @override
  Widget build(BuildContext context) {
    return devices.isEmpty
        ? const NoDeviceBanner()
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              mainAxisExtent: 125,
            ),
            itemCount: devices.length,
            itemBuilder: (_, i) {
              final device = devices[i];

              return DeviceListItem(
                device: devices[i],
                onPressed: () => Get.to(DeviceDetailScreen(device: device)),
              );
            },
          );
  }
}
