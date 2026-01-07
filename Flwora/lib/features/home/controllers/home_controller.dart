import 'package:flutter/material.dart';
import 'package:flwora/data/models/device.dart';
import 'package:flwora/data/models/sector.dart';
import 'package:flwora/data/models/user.dart';
import 'package:flwora/utils/local_storage/data_storage/device_storage.dart';
import 'package:flwora/utils/local_storage/data_storage/sector_storage.dart';
import 'package:flwora/utils/local_storage/data_storage/user_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  // Ambil data user
  final user = Rxn<User>();

  // Ambil data sectors dan devices dalam bentuk list
  final sectors = <Sector>[].obs;
  final devices = <Device>[].obs;

  // Tab Controller
  late TabController tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // Init nilai awal agar mencegah terjadinya error indeks (konsep sama seperti default tab controller)
    tabController = TabController(length: 0, vsync: this);

    // Listen perubahan user
    UserStorage.instance.stream.listen((value) {
      user.value = value;
    });

    // Listen perubahan sektor
    SectorStorage.instance.stream.listen((value) {
      sectors.assignAll(value ?? []);

      _syncTabController();
    });

    // Listen perubahan device
    DeviceStorage.instance.stream.listen((value) {
      devices.assignAll(value ?? []);
    });
  }

  void _syncTabController() {
    final newLength = sectors.length;

    if (tabController.length != newLength) {
      final oldIndex = tabController.index;

      tabController.dispose();

      // Reset tab controller dengan index aman
      tabController = TabController(
        length: newLength,
        vsync: this,
        initialIndex: oldIndex.clamp(0, newLength == 0 ? 0 : newLength - 1),
      )..index = oldIndex.clamp(0, newLength == 0 ? 0 : newLength - 1);
    }
  }

  // Ambil username yang akan ditampilkan
  String get username => user.value?.name ?? 'Guest';

  // Filter daftar perangkat berdasarkan sektor id
  List<Device> devicesBySector(int id) {
    return devices.where((d) => d.sectorId == id).toList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    tabController.dispose();
    super.onClose();
  }
}
