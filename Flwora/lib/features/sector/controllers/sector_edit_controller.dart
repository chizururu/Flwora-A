import 'package:flutter/cupertino.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/data/repositories/sector_repositories_impl.dart';
import 'package:flwora/utils/device/device_utils.dart';
import 'package:flwora/utils/http/http_result.dart';
import 'package:get/get.dart';

class SectorEditController extends GetxController {
  // Call repositories
  late SectorRepositoriesImpl repo = SectorRepositoriesImpl();

  final Sector sector;
  late final TextEditingController name;

  // Constructor
  SectorEditController({required this.sector}) {
    name = TextEditingController(text: sector.name);
  }

  final errors = Rxn<Map<String, dynamic>>();
  final isLoading = false.obs;

  void edit() async {
    // Tutup keyboard
    DeviceUtils.hideKeyboard();

    // Kosongkan validasi error
    errors.value = null;

    // Set loading true
    isLoading.value = true;

    try {
      final res = await repo.update(id: sector.id, name: name.text.toString());

      if (res is HttpSuccess<Map<String, dynamic>>) {
        Get.back();
      }

      if (res is HttpFailed<Map<String, dynamic>>) {
        errors.value = res.error;
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
