import 'package:get/route_manager.dart';
import 'package:psc_app/app/modules/auth/auth_binding.dart';
import 'package:psc_app/app/modules/auth/auth_screen.dart';
import 'package:psc_app/app/modules/chapters/chapater_binding.dart';
import 'package:psc_app/app/modules/chapters/chapter_screen.dart';
import 'package:psc_app/app/modules/course_category/course_category_binding.dart';
import 'package:psc_app/app/modules/course_category/course_category_screen.dart';
import 'package:psc_app/app/modules/main/main_binding.dart';
import 'package:psc_app/app/modules/main/main_screen.dart';
import 'package:psc_app/app/modules/onboarding/onboarding_binding.dart';
import 'package:psc_app/app/modules/onboarding/onboarding_screen.dart';
import 'package:psc_app/app/modules/studymode_screen/study_mode_binding.dart';
import 'package:psc_app/app/modules/studymode_screen/study_mode_screen.dart';

import 'package:psc_app/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.CATAGORY,
      page: () => CourseCategoryScreen(),
      binding: CourseCategoryBinding(),
    ),

    GetPage(name: Routes.CHAPTER, page: ()=>ChapterScreen(),binding: ChapaterBinding()),
    GetPage(name: Routes.STUDYMODE, page: ()=>StudyModeScreen(),binding: StudyModeBinding())
  ];
}
