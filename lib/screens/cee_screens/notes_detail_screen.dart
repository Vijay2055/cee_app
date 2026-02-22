import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/notes_controller.dart';
import 'package:psc_app/screens/show_pdf_screen.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';

class NotesDetailScreen extends StatelessWidget {
  const NotesDetailScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    return
    
    
     Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(title: title[0].toUpperCase() + title.substring(1)),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value == true) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.chapters.isEmpty) {
                return const Center(child: Text("No chapters found"));
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                itemCount: controller.chapters.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (ctx, index) {
                  final chap = controller.chapters[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ShowPdfScreen(
                          pdfUrl: chap.pdfUrl,
                          title: chap.title,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
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
                            chap.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            chap.chapter,
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
