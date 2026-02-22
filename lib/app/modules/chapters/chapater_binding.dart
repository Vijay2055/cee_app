import 'package:get/get.dart';
import 'package:psc_app/app/data/repository/course_repository/chapter_repository.dart';
import 'package:psc_app/app/modules/chapters/chpater_viewmodel.dart';

class ChapaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChapterRepository(Get.find()));
    Get.lazyPut(() => ChapterViewmodel(Get.find()));
  }
}
