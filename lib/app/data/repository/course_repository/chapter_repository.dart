import 'package:firebase_core/firebase_core.dart';
import 'package:psc_app/app/core/services/firebase/course_service/course_service.dart';
import 'package:psc_app/app/core/services/results/result.dart';
import 'package:psc_app/app/data/models/chapter_model.dart';

class ChapterRepository {
  final CourseService _service;
  const ChapterRepository(this._service);

  Future<Result<List<ChapterModel>>> getChapters({
    required String categoryId,
  }) async {
    try {
      final result = await _service.getChapters(categoryId: categoryId);
      final categories = result
          .map((item) => ChapterModel.fromJson(item))
          .toList();
      return Result.success(categories);
    } on FirebaseException catch (e) {
      return Result.error(e.message ?? "Unexpected error");
    } catch (e) {
      return Result.error("Error is due to $e");
    }
  }
}
