import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flwora/utils/bluetooth/bluetooth_service.dart';
import 'package:get/get.dart';

class CreateDeviceController extends GetxController {
  late final TBluetoothService bluetoothService = Get.find<TBluetoothService>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> startScanning() async {}

  Future<void> stopScanning() async {}

  Future<void> connect(BluetoothDevice device) async {}

  Future<void> disconnect() async {}

  Future<void> writeCommand(String command) async {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
