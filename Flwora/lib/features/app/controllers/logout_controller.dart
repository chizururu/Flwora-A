import 'package:flwora/features/authentication/screens/login.dart';
import 'package:flwora/utils/local_storage/data_storage/device_storage.dart';
import 'package:flwora/utils/local_storage/data_storage/sector_storage.dart';
import 'package:flwora/utils/local_storage/data_storage/user_storage.dart';
import 'package:flwora/utils/mqtt/mqtt_service.dart';
import 'package:get/get.dart';

class SignOutManager extends GetxController {
  static SignOutManager get instance => SignOutManager();

  void logout() async {
    // Keluar ke halaman login
    Get.off(const LoginScreen());

    // Hapus seluruh data
    await UserStorage.instance.clear();
    await SectorStorage.instance.clear();
    await DeviceStorage.instance.clear();
  }
}
