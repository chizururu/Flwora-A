import 'package:flwora/nav/controllers/nav_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavController(), permanent: true);
  }
}
