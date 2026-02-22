import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/mcq_controller.dart';

import 'package:psc_app/screens/cee_screens/cee_notes_screen.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';
import 'package:psc_app/widgets/custom_list_tiles.dart';

class SubindexScreen extends StatelessWidget {
  const SubindexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = Get.arguments;
    final mcqController = Get.put(McqController(title: title));
    return Scaffold(
      body: 
      
      Column(
        children: [
          CustomAppBar(title: "Category"),
          Expanded(
            child: Obx(() {
              if (mcqController.isCategoryLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: mcqController.categories.length,
                padding: EdgeInsets.all(0),

                itemBuilder: (context, index) {
                  return CustomListTiles(
                    onTap: () {
                      Get.to(
                        () => CeeNotesScreen(
                          title: mcqController.categories[index],
                          subtitle: "subtitle",
                        ),
                      );
                    },
                    title: mcqController.categories[index],
                    subtitle: "subtitle",
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
