import 'package:get/get.dart';
import 'package:psc_app/app/modules/main/bottom_nav_controller.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
  
  }
}
