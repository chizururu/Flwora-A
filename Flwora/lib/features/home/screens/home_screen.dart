import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/home_appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/home/controllers/home_controller.dart';
import 'package:flwora/features/home/widgets/sector_device_grid.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final sectors = controller.sectors;

      return TScaffold(
        header: HomeAppBar(),
        content: TabBarView(
          controller: controller.tabController,
          children: sectors
              .map(
                (sector) => SectorDeviceGrid(
                  devices: controller.devicesBySector(sector.id),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
