import 'package:flutter/material.dart';
import 'package:flwora/common/widgets/buttons/primary_button.dart';
import 'package:flwora/common/widgets/forms/text_field.dart';
import 'package:flwora/features/sector/controllers/sector_add_controller.dart';
import 'package:get/get.dart';

class FormAddSectorWidget extends StatelessWidget {
  const FormAddSectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SectorAddController());

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          const SizedBox(height: 30),

          Obx(
            () => TPrimaryButton(
              text: 'Simpan',
              isLoading: controller.isLoading.value,
              onPressed: controller.add,
            ),
          ),
        ],
      ),
    );
  }
}
