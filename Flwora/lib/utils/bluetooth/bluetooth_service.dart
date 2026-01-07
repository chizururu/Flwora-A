import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flwora/utils/constants/enums.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class TBluetoothService extends GetxService {
  // Stream hasil scan perangkat yang sudah filter
  final scannedDevicesController =
      StreamController<List<BluetoothDevice>>.broadcast();

  Stream<List<BluetoothDevice>> get scannedDeviceStream =>
      scannedDevicesController.stream;

  // Stream status koneksi perangkat
  final connectedDeviceController =
      StreamController<BluetoothDevice?>.broadcast();

  Stream<BluetoothDevice?> get connectedDeviceStream =>
      connectedDeviceController.stream;

  // Stream notifikasi karakteristik
  final notificationController = StreamController<String>.broadcast();

  Stream<String> get notificationStream => notificationController.stream;

  Future<void> ensureReady() async {
    try {
      final permission = await [
        Permission.location,
        Permission.bluetoothConnect,
        Permission.bluetoothScan,
      ].request();

      if (permission.values.any((p) => !p.isGranted)) {}
    } catch (_) {}
  }

  Future<void> startScanning() async {
    scannedDevicesController.add([]);
  }

  Future<void> stopScanning() async {
    await FlutterBluePlus.stopScan();

    scannedDevicesController.add([]);
  }

  Future<void> connect(BluetoothDevice device) async {}

  Future<void> disconnect() async {}

  Future<void> writeCommand(String command) async {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scannedDevicesController.close();
  }
}
