import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/menu/popup_menu.dart';
import 'package:flwora/features/device/screens/device_setup/pair_device_page.dart';
import 'package:flwora/features/home/controllers/home_controller.dart';
import 'package:flwora/features/home/widgets/sector_tab_bar.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<HomeController>();

    return TAppBar(
      leadingButton: TPopupMenuButton(
        items: [
          // Menu logout
          TMenuItem(title: 'Logout', onPressed: () => ()),
        ],
        trigger: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Nama pengguna
              Text(
                user.username,
                style: TTextTheme.body.copyWith(fontWeight: FontWeight.w600),
              ),

              // Icon
              Icon(Icons.keyboard_arrow_down_outlined),
            ],
          ),
        ),
      ),
      actionButton: TPopupMenuButton(
        items: [
          // Tambah sektor
          TMenuItem(
            title: "Tambah sektor",
            onPressed: () => Get.to(() => const Placeholder()),
          ),
          // Tambah perangkat
          TMenuItem(
            title: "Tambah perangkat",
            onPressed: () => Get.to(() => const PairDevicePage()),
          ),
        ],
        trigger: Icon(Icons.add_circle_outline_outlined),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(Sizes.xxl + 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.lg),
          child: SectorTabBar(),
        ),
      ),
      floating: true,
      pinned: true,
      leadingWidth: 200,
    );
  }
}
