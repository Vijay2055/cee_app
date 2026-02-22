import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/model/course_content_item_model.dart';
import 'package:psc_app/model/custome_info_card_model.dart';
import 'package:psc_app/screens/course_content_list_screen.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';
import 'package:psc_app/widgets/custom_card_widget.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      body: Column(
        children: [
          CustomAppBar(title: title),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: customCardList
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        final listOfContent = course_content_item_list.where(
                          (content) => content.category == item.category,
                        ).toList();
                        Get.to(CourseContentListScreen(title: title,courseItem: listOfContent,));
                      },
                      child: CustomInfoCard(
                        height: item.height,
                        width: item.width,
                        color: item.color,
                        title: item.title,
                        subtitle: item.subtile,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
