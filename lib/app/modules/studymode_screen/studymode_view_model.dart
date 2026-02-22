import 'package:get/get.dart';
import 'package:psc_app/app/core/enum/course_enum.dart';
import 'package:psc_app/app/data/models/course_category_model.dart';
import 'package:psc_app/app/routes/app_routes.dart';

class StudymodeViewModel extends GetxController {
  CourseCategoryModel? categoryModel;

  void gotoSelectedScreen(ModeOfStudy value) {
    switch (value) {
      case ModeOfStudy.mcq:
      case ModeOfStudy.notes:
        Get.toNamed(
          Routes.CHAPTER,
          arguments: {'mode': value, 'category': categoryModel},
        );
        break;
      case ModeOfStudy.test:
        break;
    }
  }

 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setCategory();
  }

  void setCategory() {
    final args = Get.arguments;
    if (args is Map) {
      categoryModel = args['category'];
      
    }
  }
}
