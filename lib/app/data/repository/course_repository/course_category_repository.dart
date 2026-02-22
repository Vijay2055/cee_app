import 'package:firebase_auth/firebase_auth.dart';
import 'package:psc_app/app/core/services/firebase/course_service/course_service.dart';
import 'package:psc_app/app/core/services/results/result.dart';
import 'package:psc_app/app/data/models/course_category_model.dart';

class CourseCategoryRepository {
  final CourseService _service;

  const CourseCategoryRepository(this._service);

  Future<Result<List<CourseCategoryModel>>> getCategory({
    required String courseid,
  }) async {
    try {
      final result = await _service.getCourseCategory(courseId: courseid);
      print(result);
      final categories = result
          .map((item) => CourseCategoryModel.fromJson(item))
          .toList();

      return Result.success(categories);
    } on FirebaseAuthException catch (e) {
      return Result.error(e.message ?? "Unexpected error");
    } catch (e) {
      return Result.error("Error due to ${e}");
    }
  }
}
