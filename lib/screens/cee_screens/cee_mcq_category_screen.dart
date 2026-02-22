import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/mcq_controller.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';

class CeeMcqCategoryScreen extends StatelessWidget {
  CeeMcqCategoryScreen({super.key, required this.title});
  final String title;
  final mcqController = Get.find<McqController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: title),

          Expanded(
            child: Obx(() {
              return mcqController.categories.isEmpty
                  ? Center(child: Text("Sorry no data"))
                  : ListView.builder(
                      itemCount: mcqController.categories.length,
                      itemBuilder: (ctx, index) {
                        return Text("Hellow");
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }
}
