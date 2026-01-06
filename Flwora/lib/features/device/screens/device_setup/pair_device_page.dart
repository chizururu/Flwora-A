import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/cards/card.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/device/controllers/create_device_controller.dart';
import 'package:flwora/features/device/screens/device_setup/widgets/device_discovery_indicator.dart';
import 'package:flwora/features/device/screens/device_setup/widgets/device_discovery_unavailable.dart';
import 'package:flwora/features/device/screens/device_setup/widgets/request_permission_banner.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:get/get.dart';

class PairDevicePage extends StatelessWidget {
  const PairDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateDeviceController>();

    return TScaffold(
      header: TAppBar(title: 'Tambahkan Perangkat', showBackButton: true),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Jika GPS dan Bluetooth mati
          RequestPermissionBanner(),
          SizedBox(height: Sizes.xxl),

          // Jika GPS dan Bluetooth mati
          DeviceDiscoveryUnavailable(),

          SizedBox(height: Sizes.xxl),

          // Jika GPS dan Bluetooth hidup
          DeviceDiscoveryIndicator(),
          SizedBox(height: Sizes.xxl),
        ],
      ),
    );
  }
}
