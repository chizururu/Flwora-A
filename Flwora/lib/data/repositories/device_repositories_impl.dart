import 'package:flwora/data/models/device.dart';
import 'package:flwora/data/sources/device_repository.dart';
import 'package:flwora/utils/local_storage/data_storage/device_storage.dart';
import 'package:flwora/utils/mqtt/mqtt_service.dart';

class DeviceRepositoriesImpl implements DeviceRepository {
  @override
  Stream<List<Device>> watchDevice() {
    // TODO: implement watchDevice
    throw UnimplementedError();
  }
}
