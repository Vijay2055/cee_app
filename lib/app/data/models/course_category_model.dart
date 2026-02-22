class CourseCategoryModel {
  final String id;
  final String courseId;
  final String category;

  CourseCategoryModel({
    required this.id,
    required this.courseId,
    required this.category,
  });

  factory CourseCategoryModel.fromJson(Map<String, dynamic> map) {
    return CourseCategoryModel(
      id: map['id'] ?? "id",
      courseId: map['courseid'] ?? "",
      category: map['category_name'] ?? "Noname",
    );
  }
}
