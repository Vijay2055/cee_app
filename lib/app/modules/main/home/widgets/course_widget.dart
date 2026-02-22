import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/core/extensions/string_capitalize_extension.dart';
import 'package:psc_app/app/modules/main/home/home_view_model.dart';
import 'package:psc_app/widgets/cee_widgets/cee_custom_card.dart';

class CourseWidget extends GetView<HomeViewModel> {
  const CourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(36, 128, 207, 231),
      ),

      child: Obx(
        () => controller.isCourseisLoading.value
            ? Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                    Text("Please wait.."),
                  ],
                ),
              )
            : GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                padding: EdgeInsets.all(10),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 6,
                childAspectRatio: 1,
                children: controller.course
                    .map(
                      (item) => CeeCustomCard(
                        onTypeSelect: () {
                          
                          controller.onCourseSelect(item.id);
                        },
                        color: item.color,
                        title: item.name.capitalFirst,
                        icon: item.icon,
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
