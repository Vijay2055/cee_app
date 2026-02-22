import 'package:flutter/material.dart';
import 'package:psc_app/app/core/enum/course_enum.dart';

class CourseUiCong {
  final Color color;
  final IconData icon;

  const CourseUiCong({required this.color, required this.icon});
}

extension CourseUix on CourseEnum {
  CourseUiCong get ui {
    switch (this) {
      case CourseEnum.physics:
        return const CourseUiCong(color: Colors.blue, icon: Icons.science);
      case CourseEnum.chemistry:
        return const CourseUiCong(
          color: Colors.green,
          icon: Icons.bubble_chart,
        );
      case CourseEnum.zoology:
        return const CourseUiCong(color: Colors.orange, icon: Icons.pets);
      case CourseEnum.botony:
        return const CourseUiCong(
          color: Colors.teal,
          icon: Icons.local_florist,
        );
      case CourseEnum.mat:
        return const CourseUiCong(color: Colors.purple, icon: Icons.calculate);
      case CourseEnum.others:
        return const CourseUiCong(color: Colors.grey, icon: Icons.category);
    }
  }
}
