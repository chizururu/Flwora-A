import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/dropdown/menu_item.dart';
import 'package:flwora/common/widgets/dropdown/t_drop_down_menu.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/features/app/controllers/logout_controller.dart';
import 'package:flwora/features/app/screens/home/widgets/sector_tab_bar.dart';
import 'package:flwora/features/sector/screens/add_sector_screen.dart';
import 'package:flwora/utils/local_storage/data_storage/user_storage.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  final List<Sector> sectors;

  const HomeHeader({super.key, required this.sectors});

  @override
  Widget build(BuildContext context) {
    final controller = SignOutManager.instance;

    return TAppbar(
      leading: [
        StreamBuilder(
          stream: UserStorage.instance.stream,
          builder: (_, user) => Text(user.data?.name.excerpt(12) ?? 'Guest'),
        ),
        TDropdownMenu(
          items: [MenuItem(label: 'Logout', onTap: controller.logout)],
          icon: Icon(Icons.keyboard_arrow_down_outlined),
        ),
      ],
      actions: [
        TDropdownMenu(
          items: [
            MenuItem(
              label: 'Tambah Sektor',
              onTap: () => Get.to(const AddSectorScreen()),
            ),
            MenuItem(label: 'Tambah Perangkat', onTap: () => ()),
          ],
          icon: const Icon(Icons.add_circle_outline_outlined),
        ),
      ],
      // Tab Sector
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectorTabBar(sectors: sectors),
        ),
      ),
      leadingWidth: 200,
      pinned: true,
      floating: true,
    );
  }
}
