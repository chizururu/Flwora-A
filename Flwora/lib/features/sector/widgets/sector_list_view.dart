import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/card/card.dart';
import 'package:flwora/common/widgets/dropdown/menu_item.dart';
import 'package:flwora/common/widgets/dropdown/t_drop_down_menu.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/features/sector/controllers/sector_edit_controller.dart';
import 'package:flwora/features/sector/widgets/sector_delete_confirm.dart';
import 'package:flwora/features/sector/widgets/sector_edit_form.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/helpers/bottom_sheet_helper.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class SectorListView extends StatelessWidget {
  final List<Sector> sectors;

  const SectorListView({super.key, required this.sectors});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      itemCount: sectors.length,
      shrinkWrap: true,
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Informasi Perangkat
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama sektor
                Text(sectors[index].name, style: TTextStyle.body),
                // Jumlah perangkat pada sektor
                Text(
                  sectors[index].deviceCountLabel,
                  style: TTextStyle.caption.colors(TColors.textPrimary40),
                ),
              ],
            ),

            // Menu untuk mengelola sektor seperti update dan delete namun khusus sector dengan home tidak dapat dihapus
            if (sectors[index].name != 'Home')
              TDropdownMenu(
                items: [
                  MenuItem(
                    label: 'Ubah',
                    onTap: () {
                      // Hapus dan regenerated kembali
                      Get.delete<SectorEditController>(force: true);

                      BottomSheetHelper.show(
                      child: SectorEditForm(sector: sectors[index]),
                    );
                    },
                  ),
                  MenuItem(
                    label: 'Hapus',
                    onTap: () => BottomSheetHelper.show(
                      child: SectorDeleteConfirm(sector: sectors[index]),
                    ),
                  ),
                ],
                icon: Icon(BootstrapIcons.three_dots_vertical, size: 12),
              ),
          ],
        ),
      ),
      separatorBuilder: (_, _) => const Divider(height: 1),
    );
  }
}
