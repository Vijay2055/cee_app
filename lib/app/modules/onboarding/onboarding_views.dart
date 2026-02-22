import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/modules/auth/auth_view.dart';
import 'package:psc_app/app/routes/app_routes.dart';
import 'package:psc_app/app/utilits/constants/constant.dart';

class OnboardingView extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;
  final item = onboardingData;

  void onPageChange(int index) {
    currentPage.value = index;
  }

  bool get isLastPage => currentPage.value == item.length - 1;

  void onNextPress() {
    if (isLastPage) {
      // show the bottom sheet

      _gotoAuthPage(AuthMode.login);
    } else {
      // go to next page
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void onSkip() {
    if (isLastPage) {
      // open the register page

      _gotoAuthPage(AuthMode.signup);
    } else {
      currentPage.value = item.length - 1;
      pageController.jumpToPage(currentPage.value);
    }
  }

  void _gotoAuthPage(AuthMode mode) {
    Get.toNamed(Routes.AUTH, arguments: {'mode': mode});
  }
}
