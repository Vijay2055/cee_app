import 'package:cloud_firestore/cloud_firestore.dart';

class CourseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCourses() async {
    final snapShot = await _firebaseFirestore.collection('courses').get();
    return snapShot.docs.map((item) => item.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getCourseCategory({
    required String courseId,
  }) async {
    final snapShot = await _firebaseFirestore
        .collection("coursecategories")
        .where('courseid', isEqualTo: courseId)
        .get();

    return snapShot.docs.map((item) => item.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getChapters({
    required String categoryId,
  }) async {
    final snapshot = await _firebaseFirestore
        .collection('chapters')
        .where('categoryid', isEqualTo: categoryId)
        .get();

        return snapshot.docs.map((item)=>item.data()).toList();

  }
}
