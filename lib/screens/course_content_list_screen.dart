import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/model/course_content_item_model.dart';
import 'package:psc_app/screens/course_detail_scren.dart';
import 'package:psc_app/view_model/pdf_view_model.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';
import 'package:psc_app/widgets/custom_list_tiles.dart';

class CourseContentListScreen extends StatelessWidget {
  CourseContentListScreen({
    super.key,
    required this.title,
    required this.courseItem,
  });
  final String title;
  final List<CourseContentItemModel> courseItem;
  final pdfViewModel = Get.find<PdfViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: title),
          Expanded(
            child: ListView.builder(
              itemCount: courseItem.length,
              padding: EdgeInsets.all(0),

              itemBuilder: (context, index) {
                return CustomListTiles(
                  onTap: () {
                    if (courseItem[index].subCategory == null) {
                      Get.snackbar("No Data", "Comming Soon");
                      return;
                    }
                    pdfViewModel.getPdfData(courseItem[index].subCategory!);
                    Get.to(CourseDetailScren());
                  },
                  title: courseItem[index].title,
                  subtitle: courseItem[index].subtitle,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
