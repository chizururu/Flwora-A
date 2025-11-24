import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/buttons/outlined_button.dart';
import 'package:flwora/common/widgets/buttons/primary_button.dart';
import 'package:flwora/common/widgets/modal/modal_bottom.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/utils/theme/widget_themes/text_theme.dart';
import 'package:get/get.dart';

class SectorDeleteConfirm extends StatelessWidget {
  final Sector sector;

  const SectorDeleteConfirm({super.key, required this.sector});

  @override
  Widget build(BuildContext context) {
    return ModalBottom(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Konfirmasi
          Text(
            'Jika Anda menghapus ${sector.name}, tidak dapat melihat kembali. Dipastikan tidak ada perangkat yang tersimpan di sektor. Yakin akan menghapus ${sector.name}?',
            style: TTextStyle.body,
          ),
          const SizedBox(height: 25),

          // Action button
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Expanded(
                child: TOutlinedButton(
                  text: 'Batal',
                  onPressed: () => Get.back(),
                ),
              ),
              Expanded(
                child: TOutlinedButton.destructive(
                  text: 'Hapus',
                  onPressed: () => (),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
