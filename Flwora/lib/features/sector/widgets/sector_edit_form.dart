import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/buttons/outlined_button.dart';
import 'package:flwora/common/widgets/buttons/primary_button.dart';
import 'package:flwora/common/widgets/forms/text_field.dart';
import 'package:flwora/common/widgets/modal/modal_bottom.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/features/sector/controllers/sector_edit_controller.dart';
import 'package:flwora/utils/device/device_utils.dart';
import 'package:get/get.dart';

class SectorEditForm extends StatelessWidget {
  final Sector sector;

  const SectorEditForm({super.key, required this.sector});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SectorEditController(sector: sector));

    return ModalBottom(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Nama sektor
          Obx(
            () => TTextFormField(
              controller: controller.name,
              label: 'Nama Sektor',
              errorMessage: controller.errors.value?['name']?.first,
              enabled: controller.isLoading.value,
            ),
          ),
          const SizedBox(height: 25),

          // Action button
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Expanded(
                  child: TOutlinedButton(
                    text: 'Batal',
                    onPressed: () {
                      // Tutup keyboard
                      DeviceUtils.hideKeyboard(context);
                      // Tutup modal
                      Get.back(result: true);
                    },
                    isLoading: controller.isLoading.value,
                  ),
                ),
                Expanded(
                  child: TPrimaryButton(
                    text: 'Simpan',
                    onPressed: () => controller.edit(),
                    isLoading: controller.isLoading.value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
