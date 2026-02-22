import 'package:get/get.dart';
import 'package:psc_app/controller/bottom_nav_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BottomNavController());
  }
}
