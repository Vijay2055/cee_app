import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/notes_controller.dart';
import 'package:psc_app/screens/show_pdf_screen.dart';

class PastYearQuestionScreen extends StatelessWidget {
  const PastYearQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pastController = Get.put(NotesController());
    return Scaffold(
      appBar: AppBar(title: Text("Past Year Paper")),
      body: Obx(() {
        return pastController.isLoadingPastPaper.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: pastController.pastYearsPaper.length,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (ctx, index) {
                  return ListTile(
                    onTap: () {
                      Get.to(
                        ShowPdfScreen(
                          pdfUrl: pastController.pastYearsPaper[index].url,
                          title: pastController.pastYearsPaper[index].year,
                        ),
                      );
                    },
                    title: Text(
                      'Question paper ${pastController.pastYearsPaper[index].year}',
                    ),
                  );
                },
              );
      }),
    );
  }
}
