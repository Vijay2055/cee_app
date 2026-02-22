import 'package:get/get.dart';
import 'package:psc_app/app/modules/onboarding/onboarding_views.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingView());
  }
}
