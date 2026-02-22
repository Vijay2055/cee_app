import 'package:get/get.dart';
import 'package:psc_app/app/modules/studymode_screen/studymode_view_model.dart';

class StudyModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudymodeViewModel());
  }
}
