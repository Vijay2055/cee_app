import 'package:flutter/material.dart';
import 'package:psc_app/app/core/enum/course_enum.dart';
import 'package:psc_app/app/core/extensions/enum_extension.dart';

class CourseModel {
  final String id;
  final String name;
  final CourseEnum courseEnum;

  CourseModel({required this.id, required this.name, required this.courseEnum});

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      name: map['coursename'],
      courseEnum: getCourseEnum(map['coursename']),
    );
  }

  Color get color => courseEnum.ui.color;
  IconData get icon => courseEnum.ui.icon;
}

CourseEnum getCourseEnum(String name) {
  return CourseEnum.values.firstWhere(
    (value) => value.name.toLowerCase() == name.toLowerCase(),
    orElse: () => CourseEnum.others,
  );
}
