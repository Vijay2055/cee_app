import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:psc_app/data/repository/cee_repository/notes_repository.dart';
import 'package:psc_app/model/cee_model/chapter_model.dart';

class NotesController extends GetxController {
  final NotesRepository repository = NotesRepository();
  var isLoading = false.obs;
  final isLoadingPastPaper = false.obs;
  var chapters = <Chapter>[].obs;
  final pastYearsPaper = <PastYearPaper>[].obs;

  Future<void> loadChapter(String category, String subcategory) async {
    try {
      isLoading.value = true;
      chapters.value = await repository.getChapters(category, subcategory);
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadPastYearPaper() async {
    try {
      isLoadingPastPaper.value = true;
      pastYearsPaper.value = await repository.getPastYearPaper();
    } on FirebaseException catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoadingPastPaper.value = false;
    }
  }
}
