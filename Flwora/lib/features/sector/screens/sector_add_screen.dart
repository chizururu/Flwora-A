import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/appbar/appbar.dart';
import 'package:flwora/common/widgets/scaffold/scaffold.dart';
import 'package:flwora/features/sector/controllers/sector_add_controller.dart';
import 'package:flwora/features/sector/widgets/sector_add_form.dart';
import 'package:flwora/utils/constants/colors.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class SectorAddScreen extends StatelessWidget {
  const SectorAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(SectorAddController());

    return TScaffold(
      appbar: TAppbar(hasBackButton: true, title: 'Tambah Sektor'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 10,
        children: [
          // Sub heading
          Text(
            'Masukkan nama sektor untuk menambah sektor baru',
            style: TTextStyle.body,
          ),

          const SizedBox(height: 15),

          const FormAddSectorWidget(),
        ],
      ),
    );
  }
}
