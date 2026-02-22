import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/modules/main/home/home_binding.dart';
import 'package:psc_app/app/modules/main/home/home_view_model.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController();
    HomeBinding().dependencies();
    super.onInit();
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
    if (index == 0 && !Get.isRegistered<HomeViewModel>()) {
      HomeBinding().dependencies();
    }
  }

  void onItemTapped(int index) {
    if (index == 0 && !Get.isRegistered<HomeViewModel>()) {
      HomeBinding().dependencies();
    }
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
