import 'package:flutter/material.dart';
import 'package:flwora/nav/controllers/nav_controller.dart';
import 'package:flwora/nav/models/destination.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavController>();

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.navigateTo,
          destinations: destinations
              .map(
                (e) => NavigationDestination(
                  icon: Icon(e.icon),
                  selectedIcon: Icon(e.selectedIcon),
                  label: e.label,
                ),
              )
              .toList(),
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: destinations.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}
