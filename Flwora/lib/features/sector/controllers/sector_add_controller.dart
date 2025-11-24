import 'package:flutter/cupertino.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/data/repositories/sector_repositories_impl.dart';
import 'package:flwora/utils/device/device_utils.dart';
import 'package:flwora/utils/http/http_result.dart';
import 'package:flwora/utils/local_storage/data_storage/sector_storage.dart';
import 'package:get/get.dart';

class SectorAddController extends GetxController {
  // Instances
  static SectorAddController get instance => Get.find();

  // Call repositories
  late SectorRepositoriesImpl repo = Get.put(SectorRepositoriesImpl());

  final name = TextEditingController();

  final errors = Rxn<Map<String, dynamic>>();
  final isLoading = false.obs;

  void add() async {
    // Tutup keyboard
    DeviceUtils.hideKeyboard();

    // Kosongkan validasi error
    errors.value = null;

    // Set loading true
    isLoading.value = true;

    try {
      final res = await repo.add(name: name.text.toString());

      if (res is HttpSuccess<Map<String, dynamic>>) {
        final sector = Sector.fromJson(res.data?['sector']);

        await SectorStorage.instance.storeItem([sector]);

        Get.back();
      }

      if (res is HttpFailed<Map<String, dynamic>>) {
        errors.value = res.error;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
