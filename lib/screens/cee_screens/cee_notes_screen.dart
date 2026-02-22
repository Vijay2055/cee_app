import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/mcq_controller.dart';
import 'package:psc_app/controller/cee_controller/notes_controller.dart';
import 'package:psc_app/screens/cee_screens/cee_mcq_category_screen.dart';
import 'package:psc_app/screens/cee_screens/notes_detail_screen.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';
import 'package:psc_app/widgets/custom_list_tiles.dart';

class CeeNotesScreen extends StatelessWidget {
  CeeNotesScreen({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  final mcqController = Get.find<McqController>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    return 
    Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: title[0].toUpperCase() + title.substring(1)),

          CustomListTiles(
            onTap: () {
              controller.loadChapter(
                title.toLowerCase(),
                subtitle.toLowerCase(),
              );
              Get.to(NotesDetailScreen(title: subtitle));
            },
            title: "Notes",
            subtitle: "Tap to read notes",
          ),

          CustomListTiles(
            onTap: () {
              mcqController.loadCategory(title);
              Get.to(() => CeeMcqCategoryScreen(title: title));
            },
            title: "MCQ",
            subtitle: "Tap to practice Mcq",
          ),

          CustomListTiles(
            onTap: () {
              // if (courseItem[index].subCategory == null) {
              //   Get.snackbar("No Data", "Comming Soon");
              //   return;
              // }

              // Get.to(CourseDetailScren());
            },
            title: "Play Quiz",
            subtitle: "Tap to play quiz",
          ),
        ],
      ),
    );
  }
}
