import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/core/enum/course_enum.dart';
import 'package:psc_app/app/core/extensions/string_capitalize_extension.dart';
import 'package:psc_app/app/modules/studymode_screen/studymode_view_model.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';
import 'package:psc_app/widgets/custom_list_tiles.dart';

class StudyModeScreen extends GetView<StudymodeViewModel> {
  const StudyModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: controller.categoryModel?.category.capitalFirst ?? "Title",
          ),

          CustomListTiles(
            onTap: () {
              controller.gotoSelectedScreen(ModeOfStudy.notes);
            },
            title: "Notes",
            subtitle: "Tap to read notes",
          ),

          CustomListTiles(
            onTap: () {
              controller.gotoSelectedScreen(ModeOfStudy.mcq);
            },
            title: "MCQ",
            subtitle: "Tap to practice Mcq",
          ),

          CustomListTiles(
            onTap: () {
              controller.gotoSelectedScreen(ModeOfStudy.test);
            },
            title: "Give Test",
            subtitle: "Tap to Give test",
          ),
        ],
      ),
    );
  }
}
