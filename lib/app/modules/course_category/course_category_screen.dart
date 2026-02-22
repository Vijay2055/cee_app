import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/core/extensions/string_capitalize_extension.dart';
import 'package:psc_app/app/modules/course_category/course_category_view_model.dart';
import 'package:psc_app/widgets/custom_list_tiles.dart';

class CourseCategoryScreen extends GetView<CourseCategoryViewModel> {
  const CourseCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        title: Text("Category"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.cateogories.isEmpty) {
          return Center(child: Text("No categories found"));
        }

        return ListView.builder(
          itemCount: controller.cateogories.length,
          padding: EdgeInsets.all(0),

          itemBuilder: (context, index) {
            final cateName = controller.cateogories[index].category;
            final splitedList = cateName.split(' ');
            final upperList = splitedList.map((item) => item.capitalFirst);
            final name = upperList.join(' ');

            return CustomListTiles(
              onTap: () {
                controller.onSelectedScreen(controller.cateogories[index]);
              },
              title: name,
              subtitle: "subtitle",
            );
          },
        );
      }),
    );
  }
}
