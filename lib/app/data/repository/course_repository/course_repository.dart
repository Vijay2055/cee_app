import 'package:firebase_core/firebase_core.dart';
import 'package:psc_app/app/core/services/firebase/course_service/course_service.dart';
import 'package:psc_app/app/core/services/results/result.dart';
import 'package:psc_app/app/data/models/course_model.dart';

class CourseRepository {
  final CourseService _service;
  const CourseRepository(this._service);

  Future<Result<List<CourseModel>>> getCourses() async {
    try {
      final result = await _service.getCourses();
      final courses = result.map((item) => CourseModel.fromMap(item)).toList();

      return Result.success(courses);
    } on FirebaseException catch (e) {
      return Result.error(e.message ?? "Something went wrong");
    } catch (e) {
      return Result.error("Error is due to $e");
    }
  }
}
