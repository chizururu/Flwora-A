import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class TBluetoothService extends GetxService {
  Future<bool> ensureReady() async {
    try {
      final locationStatus = await Permission.location.request();
      final scanStatus = await Permission.bluetoothScan.request();
      final connectStatus = await Permission.bluetoothConnect.request();

      if (!locationStatus.isGranted ||
          !scanStatus.isGranted ||
          !connectStatus.isGranted) {
        return false;
      }

      var adapterState = await FlutterBluePlus.adapterState.first;
      if (adapterState == BluetoothAdapterState.off ||
          adapterState == BluetoothAdapterState.turningOff) {
        await FlutterBluePlus.turnOn();
        adapterState = await FlutterBluePlus.adapterState.firstWhere(
          (state) => state == BluetoothAdapterState.on,
        );
      }

      var serviceStatus = await Permission.location.serviceStatus;
      if (!serviceStatus.isEnabled) {
        await Geolocator.openLocationSettings();
        final afterStatus = await Permission.location.serviceStatus;
        if (!afterStatus.isEnabled) return false;
      }

      return true;
    } catch (_) {
      return false;
    }
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
