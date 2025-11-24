import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/dropdown/menu_extras.dart';
import 'package:flwora/common/widgets/dropdown/menu_item.dart';
import 'package:flwora/common/widgets/dropdown/t_drop_down_menu.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/features/sector/screens/sector_manager_screen.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class SectorTabBar extends StatelessWidget {
  final List<Sector> sectors;

  const SectorTabBar({super.key, required this.sectors});

  @override
  Widget build(BuildContext context) {
    // Ambil TabController dari DefaultTabController
    final tabController = DefaultTabController.of(context);

    // List untuk menu yang bisa discroll
    final List<PopupMenuEntry<void>> values =
        List<PopupMenuEntry<void>>.generate(sectors.length, (index) {
          final sector = sectors[index];

          return PopupMenuItem<void>(
            onTap: () {
              tabController.animateTo(index); // pindah tab saat sektor di-klik
            },
            child: Text(
              sector.name.excerpt(20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        // Sector TabBar
        Expanded(
          child: TabBar(
            physics: const ClampingScrollPhysics(),
            isScrollable: true,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
            splashFactory: NoSplash.splashFactory,
            dividerHeight: 0,
            labelPadding: EdgeInsets.zero,
            labelStyle: TTextStyle.body.weight(FontWeight.w600),
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: TTextStyle.body,
            tabs: sectors.asMap().entries.map((entry) {
              final index = entry.key;
              final sector = entry.value;
              final length = sectors.length;

              final left = (index == 0) ? 0.0 : 18.0;
              final right = (index == length - 1) ? 0.0 : 18.0;

              return Tab(
                child: Padding(
                  padding: EdgeInsets.only(left: left, right: right),
                  child: Text(
                    sector.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }).toList(),
            tabAlignment: TabAlignment.start,
          ),
        ),

        // Dropdown menu
        TDropdownMenu<void>(
          items: [
            // List sektor yang bisa discroll
            MenuListScrollable<void>(values: values),
            MenuDivider<void>(),
            MenuItemWithIcon<void>(
              label: 'Kelola Sektor',
              onTap: () => Get.to(const ManagerSectorScreen()),
              icon: BootstrapIcons.box,
            ),
          ],
          icon: const Icon(BootstrapIcons.list),
        ),
      ],
    );
  }
}
