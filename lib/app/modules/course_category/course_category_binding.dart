import 'package:get/get.dart';
import 'package:psc_app/app/data/repository/course_repository/course_category_repository.dart';
import 'package:psc_app/app/modules/course_category/course_category_view_model.dart';

class CourseCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseCategoryRepository(Get.find()));
    Get.lazyPut(() => CourseCategoryViewModel(Get.find()));
  }
}
