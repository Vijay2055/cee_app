import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Course { physics, chemistry, botony, zoology, mat, others }

class CeeCustominfoModel {
  final String title;
  final IconData icon;
  final String subjectType;
  final double height;
  final double width;
  final Color color;

  CeeCustominfoModel({
    required this.title,
    required this.icon,
    required this.subjectType,
    required this.height,
    required this.width,
    required this.color,
  });
}

final listOfSubject = [
  CeeCustominfoModel(
    title: "Syllabus",
    icon: Icons.book,
    subjectType: "syllabus",
    height: 0.2,
    width: 0.2,
    color: const Color(0xFF67ACFF),
  ),
  CeeCustominfoModel(
    title: "Physics",
    icon: Icons.science_outlined,
    subjectType: "physics",
    height: 0.2,
    width: 0.2,
    color: const Color(0xFFB7A3FE),
  ),
  CeeCustominfoModel(
    title: "Chemistry",
    icon: Icons.biotech_outlined,
    subjectType: "chemistry",
    height: 0.2,
    width: 0.2,
    color: const Color(0xFF5BCECB),
  ),
  CeeCustominfoModel(
    title: "Zoology",
    icon: Icons.pets,
    subjectType: "zoology",
    height: 0.2,
    width: 0.2,
    color: const Color(0xFF67ACFF),
  ),
  CeeCustominfoModel(
    title: "Botany",
    icon: Icons.eco,
    subjectType: "botany",
    height: 0.2,
    width: 0.2,
    color: const Color(0xFFB7A3FE),
  ),
  CeeCustominfoModel(
    title: "MAT",
    icon: Icons.psychology,
    subjectType: "mental ability",
    height: 0.2,
    width: 0.2,
    color: const Color(0xFF67ACFF),
  ),
];

Map<String, Color> colorAndIcon(Course value) {
  switch (value) {
    case Course.physics:
      return {};
    case Course.chemistry:
      return {};
    case Course.zoology:
      return {};
    case Course.botony:
      return {};
    case Course.mat:
      return {};
    case Course.others:
      return {};
  }
}
