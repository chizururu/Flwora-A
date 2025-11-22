import 'package:flwora/data/repositories/device_repositories_impl.dart';
import 'package:flwora/data/repositories/sector_repositories_impl.dart';
import 'package:flwora/data/repositories/user_repositories_impl.dart';
// import 'package:flwora/features/device/controllers/device_sync_service.dart';
import 'package:flwora/utils/constants/server.dart';
import 'package:flwora/utils/helpers/network_manager.dart';
import 'package:flwora/utils/helpers/session_data_store.dart';
import 'package:flwora/utils/mqtt/mqtt_service.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    // Network dan Session Data (Core)
    Get.put(NetworkManager(), permanent: true);
    Get.put(SessionDataStore(), permanent: true);

    // Mqtt Service
    await Get.putAsync<MqttService>(() async {
      final service = MqttService(host: TServer.host, port: 1883);
      return service.init();
    }, permanent: true);

    // Repositories
    Get.put(UserRepositoriesImpl(), permanent: true);
    Get.put(SectorRepositoriesImpl(), permanent: true);
    Get.put(DeviceRepositoriesImpl(), permanent: true);

    // Device Sync Service untuk perubahan data
    // Get.put(DeviceSyncService(), permanent: true);
  }
}
