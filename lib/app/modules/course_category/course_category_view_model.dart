import 'package:get/get.dart';
import 'package:psc_app/app/data/models/course_category_model.dart';
import 'package:psc_app/app/data/repository/course_repository/course_category_repository.dart';
import 'package:psc_app/app/routes/app_routes.dart';

class CourseCategoryViewModel extends GetxController {
  final isLoading = false.obs;
  final CourseCategoryRepository _repository;
  final cateogories = <CourseCategoryModel>[].obs;

  CourseCategoryViewModel(this._repository);

  String? courseId;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setId();
    fetchCateogories();
  }

  void setId() {
    final args = Get.arguments;
    if (args is String && args.isNotEmpty) {
      courseId = args;
    } else if (args is Map && args["courseId"] != null) {
      courseId = args["courseId"].toString();
    } else {
      Get.snackbar("Error", "Course ID not found");
      courseId = null;
    }
  }

  void onSelectedScreen(CourseCategoryModel category) {
   
    Get.toNamed(Routes.STUDYMODE, arguments: {
      'category':category
    });
  }

  Future<void> fetchCateogories() async {
    if (courseId == null) {
      return;
    }
    isLoading.value = true;
    final result = await _repository.getCategory(courseid: courseId!);

    isLoading.value = false;

    if (!result.isSuccess) {
      Get.snackbar("Error", result.error ?? "Unexpected error");
      print(result.error);
      return;
    }
    if (result.data == null || result.data!.isEmpty) {
      Get.snackbar("Empty", "No data found");
      cateogories.clear();
      return;
    }

    cateogories.assignAll(result.data!);
  }
}
