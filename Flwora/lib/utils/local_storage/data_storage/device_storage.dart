import 'package:flwora/data/models/device.dart';
import 'package:flwora/utils/local_storage/base_storage.dart';

class DeviceStorage extends TBaseStorage<List<Device>> {
  // Constructor
  DeviceStorage._internal();

  // Instance tunggal
  static final DeviceStorage instance = DeviceStorage._internal();

  @override
  // TODO: implement key
  String get key => 'app.device';

  @override
  List<Device> fromJson(json) => (json as List<dynamic>)
      .cast<Map<String, dynamic>>()
      .map((device) => Device.fromJson(device))
      .toList();

  @override
  toJson(List<Device> item) => item.map((device) => device.toJson()).toList();
}
