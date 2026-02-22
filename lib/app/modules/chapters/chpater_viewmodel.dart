import 'package:get/get.dart';
import 'package:psc_app/app/core/enum/course_enum.dart';
import 'package:psc_app/app/data/models/chapter_model.dart';
import 'package:psc_app/app/data/models/course_category_model.dart';
import 'package:psc_app/app/data/repository/course_repository/chapter_repository.dart';

class ChapterViewmodel extends GetxController {
  final ChapterRepository _repository;

  ChapterViewmodel(this._repository);

  final mode = Rxn<ModeOfStudy>();

  final isLoading = false.obs;
  List<ChapterModel> chapter = <ChapterModel>[];

  String? categoryId;
  String? title;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setCategoryId();
    fetchChapters();
  }

  void setCategoryId() {
    final args = Get.arguments;

    if (args is Map) {
      CourseCategoryModel? category = args['category'];
      mode.value = args['mode'];
      if (category != null) {
        categoryId = category.id;
        title = category.category;
      }
    }
  }

  Future<void> fetchChapters() async {
    if (categoryId == null || categoryId!.isEmpty) {
      Get.snackbar("Error", "No category id found");
      return;
    }

    isLoading.value = true;

    final result = await _repository.getChapters(categoryId: categoryId!);
    print(result.data);
    if (!result.isSuccess) {
      Get.snackbar("Errror", result.error ?? "Unexpected error");
      chapter.clear();
      return;
    }

    if (result.data == null || result.data!.isEmpty) {
      Get.snackbar("Empty", "No chapter found");
      return;
    }

    chapter.assignAll(result.data!);

    isLoading.value = false;
  }
}
