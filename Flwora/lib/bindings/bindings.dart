import 'package:flwora/utils/helpers/network_manager.dart';
import 'package:flwora/utils/helpers/session_data_store.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager(), permanent: true);
    Get.put(SessionDataStore(), permanent: true);

    // Mqtt Service
  }
}
