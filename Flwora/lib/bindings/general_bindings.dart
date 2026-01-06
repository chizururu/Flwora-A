import 'package:flwora/features/device/controllers/create_device_controller.dart';
import 'package:flwora/utils/bluetooth/bluetooth_service.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(TBluetoothService());
    Get.put(CreateDeviceController());
  }
}
