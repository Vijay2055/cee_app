import 'package:flutter/material.dart';

class CeeQuizeModel {
  final String category;
  final IconData icon;

  CeeQuizeModel({required this.category, required this.icon});
}

final listOfCeeCategory = [
  CeeQuizeModel(category: "Physics", icon: Icons.waves_outlined),
  CeeQuizeModel(category: "Chemistry", icon: Icons.science_outlined),
  CeeQuizeModel(category: "Botany", icon: Icons.eco_outlined),
  CeeQuizeModel(category: "Zoology", icon: Icons.pets_outlined),
  CeeQuizeModel(category: "Metal Ability", icon: Icons.psychology_outlined),
];
