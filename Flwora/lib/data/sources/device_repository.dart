import 'package:flwora/data/models/device.dart';
import 'package:flwora/utils/local_storage/data_storage/device_storage.dart';

abstract class DeviceRepository {
  Stream<List<Device>> watchDevice();
}
