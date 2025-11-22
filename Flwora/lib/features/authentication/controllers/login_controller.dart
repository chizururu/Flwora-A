import 'package:flutter/material.dart';
import 'package:flwora/data/models/device.dart';
import 'package:flwora/utils/helpers/toast_helpers.dart';
import 'package:flwora/utils/local_storage/data_storage/device_storage.dart';
import 'package:get/get.dart';

import '../../../data/models/sector.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/user_repositories_impl.dart';
import '../../../utils/helpers/json_helper.dart';
import '../../../utils/http/http_result.dart';
import '../../../utils/local_storage/data_storage/sector_storage.dart';
import '../../../utils/local_storage/data_storage/user_storage.dart';
import '../../app/screens/home/home.dart';

class LoginController extends GetxController {
  // Call repositories
  late UserRepositoriesImpl repo = Get.find<UserRepositoriesImpl>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final errors = Rxn<Map<String, dynamic>>();
  final isLoading = false.obs;

  // Register
  void login() async {
    // Kosongkan validasi error
    errors.value = null;

    // Set loading true
    isLoading.value = true;

    try {
      final res = await repo.login(
        email: email.text.toString(),
        password: password.text,
      );

      if (res is HttpSuccess<Map<String, dynamic>>) {
        final user = User.fromJson(res.data?['user']);
        final sectors = JsonHelper.parseList(
          res.data?['sector'] as List,
          (json) => Sector.fromJson(json),
        );
        final devices = JsonHelper.parseList(
          res.data?['device'] as List,
          (json) => Device.fromJson(json),
        );

        await UserStorage.instance.storeItem(user);
        await SectorStorage.instance.storeItem(sectors);
        await DeviceStorage.instance.storeItem(devices);

        // Toast Closess

        Get.off(const HomeScreen());
      }

      if (res is HttpFailed<Map<String, dynamic>>) {
        errors.value = res.error;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
