import 'package:get/get.dart';

class NavController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  void navigateTo(int index) => selectedIndex.value = index;
}
