import 'package:get/get.dart';


class CeeSwitchController extends GetxController {
  final isDark = false.obs;
  final isNotification = false.obs;


  void setDart(bool value) {
    isDark.value = value;
    
  }

  void setNotification(bool value) {
    isNotification.value = value;
    
  }



}
