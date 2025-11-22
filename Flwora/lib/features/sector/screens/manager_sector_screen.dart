import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/dropdown/menu_item.dart';
import 'package:flwora/common/widgets/dropdown/t_drop_down_menu.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/sector/screens/add_sector_screen.dart';
import 'package:get/get.dart';

class ManagerSectorScreen extends StatelessWidget {
  const ManagerSectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      appbar: TAppbar(
        hasBackButton: true,
        title: 'Kelola Sektor',
        actionIcon: Icons.add_circle_outline_outlined,
        onActionPressed: () => Get.to(const AddSectorScreen()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20,
        children: [],
      ),
    );
  }
}
