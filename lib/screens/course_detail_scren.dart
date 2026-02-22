import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/screens/show_pdf_screen.dart';
import 'package:psc_app/view_model/pdf_view_model.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';

class CourseDetailScren extends StatelessWidget {
  CourseDetailScren({super.key});
  final pdfViewModel = Get.find<PdfViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(title: "Detail"),
          Expanded(
            child: Obx(() {
              if (pdfViewModel.isLoading.value == true) {
                return Center(child: CircularProgressIndicator());
              }

              if (pdfViewModel.pdfData.value == null ||
                  pdfViewModel.pdfData.value!.isEmpty) {
                return Center(
                  child: Text(
                    "No data to show",
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                itemCount: pdfViewModel.pdfData.value?.length ?? 0,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (ctx, index) {
                  final data = pdfViewModel.pdfData.value?[index];
                  if (data == null) {
                    return Text("Null");
                  }
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ShowPdfScreen(
                          pdfUrl: data.pdfUrl,
                          title: data.title,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            data.subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
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
