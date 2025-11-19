import 'package:flwora/data/models/device.dart';
import 'package:flwora/utils/local_storage/base_storage.dart';

class DeviceStorage extends TBaseStorage<List<Device>> {
  // Constructor
  DeviceStorage._internal({super.store});

  // Instance tunggal
  static final DeviceStorage instance = DeviceStorage._internal();

  // Instance global
  factory DeviceStorage() => instance;

  @override
  // TODO: implement key
  String get key => 'app.device';

  @override
  List<Device> fromJson(json) =>
      (json as List<dynamic>).cast().map((v) => Device.fromJson(v)).toList();

  @override
  toJson(List<Device> item) => item.map((v) => v.toJson()).toList();
}
