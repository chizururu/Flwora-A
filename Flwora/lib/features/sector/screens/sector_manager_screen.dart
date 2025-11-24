import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/card/card.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/sector/screens/sector_add_screen.dart';
import 'package:flwora/features/sector/widgets/sector_list_view.dart';
import 'package:flwora/utils/local_storage/data_storage/sector_storage.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class ManagerSectorScreen extends StatelessWidget {
  const ManagerSectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TScaffold(
      appbar: TAppbar(
        hasBackButton: true,
        title: 'Manajemen Sektor',
        actionIcon: Icons.add_circle_outline_outlined,
        onActionPressed: () => Get.to(const SectorAddScreen()),
        pinned: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          // Heading
          Text('Manajemen Sektor', style: TTextStyle.headingMedium),

          // Sub heading
          Text(
            'Kelola struktur sektor Anda dengan bebas—mulai dari menambah hingga memperbarui',
            style: TTextStyle.body,
          ),

          SizedBox(height: 10),

          StreamBuilder(
            stream: SectorStorage.instance.stream,
            builder: (_, sector) => TCard(
              elevation: 1.5,
              child: SectorListView(sectors: sector.data ?? []),
            ),
          ),
        ],
      ),
    );
  }
}
