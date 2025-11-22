import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/sector.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/user_repositories_impl.dart';
import '../../app/screens/home/home.dart';
import '../../../utils/helpers/json_helper.dart';
import '../../../utils/http/http_result.dart';
import '../../../utils/local_storage/data_storage/sector_storage.dart';
import '../../../utils/local_storage/data_storage/user_storage.dart';

class RegisterController extends GetxController {
  // Call repositories
  late UserRepositoriesImpl repo = Get.find<UserRepositoriesImpl>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final errors = Rxn<Map<String, dynamic>>();
  final isLoading = false.obs;

  // Register
  void register() async {
    // Kosongkan validasi error
    errors.value = null;

    // Set loading true
    isLoading.value = true;

    try {
      final res = await repo.register(
        name: name.text.toString(),
        email: email.text.toString(),
        password: password.text,
        confirmPassword: confirmPassword.text,
      );

      if (res is HttpSuccess<Map<String, dynamic>>) {
        final user = User.fromJson(res.data?['user']);
        final sectors = JsonHelper.parseList(
          res.data?['sector'] as List,
          (json) => Sector.fromJson(json),
        );

        await UserStorage.instance.storeItem(user);
        await SectorStorage.instance.storeItem(sectors);

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
