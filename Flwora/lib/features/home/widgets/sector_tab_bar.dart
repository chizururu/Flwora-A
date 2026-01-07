import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/menu/popup_menu.dart';
import 'package:flwora/features/home/controllers/home_controller.dart';
import 'package:flwora/utils/constants/sizes.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class SectorTabBar extends StatelessWidget {
  const SectorTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final List<BaseMenuItem<void>> values = List<BaseMenuItem<void>>.generate(
        controller.sectors.length,
        (index) {
          final sector = controller.sectors[index];
          return TMenuItem<void>(
            title: sector.name.excerpt(8),
            onPressed: () => controller.tabController.animateTo(index),
          );
        },
      );

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TabBar yang berisi sektor
          Expanded(
            child: TabBar(
              controller: controller.tabController,
              physics: const ClampingScrollPhysics(),
              isScrollable: true,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.transparent, width: 0),
              ),
              splashFactory: NoSplash.splashFactory,
              dividerHeight: 0,
              labelPadding: EdgeInsets.zero,
              labelStyle: TTextTheme.body.copyWith(fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: TTextTheme.body,
              tabs: controller.sectors.asMap().entries.map((entry) {
                final index = entry.key;
                final sector = entry.value;
                final length = controller.sectors.length;

                final left = (index == 0) ? 0.0 : Sizes.lg + 2;
                final right = (index == length - 1) ? 0.0 : Sizes.lg + 2;

                return Tab(
                  child: Padding(
                    padding: EdgeInsets.only(left: left, right: right),
                    child: Text(
                      sector.name.excerpt(8),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList(),
              tabAlignment: TabAlignment.start,
            ),
          ),
          const SizedBox(width: Sizes.md),
          // PopupMenu yang dapat menampilkan tab sector dan kelola sektor
          TPopupMenuButton(
            items: [
              // List sektor dalam bentuk scrollable di dalam menu
              TMenuListItem<void>(values: values),

              TMenuDivider<void>(),

              // Menu kelola sektor
              TMenuItem(
                title: "Kelola Sektor",
                icon: BootstrapIcons.bounding_box_circles,
                iconSize: Sizes.iconMd,
                onPressed: () => (),
              ),
            ],
            trigger: Icon(BootstrapIcons.list, size: Sizes.iconLg),
          ),
        ],
      );
    });
  }
}
