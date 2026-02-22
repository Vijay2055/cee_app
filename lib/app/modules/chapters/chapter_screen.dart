import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:psc_app/app/core/extensions/string_capitalize_extension.dart';
import 'package:psc_app/app/modules/chapters/chpater_viewmodel.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';

class ChapterScreen extends GetView<ChapterViewmodel> {
  const ChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(title: controller.title?.capitalFirst ?? "Title"),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value == true) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.chapter.isEmpty) {
                return const Center(child: Text("No chapters found"));
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                itemCount: controller.chapter.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (ctx, index) {
                  final chapter = controller.chapter[index];

                  return GestureDetector(
                    onTap: () {
                      // Get.to(
                      //   () => ShowPdfScreen(
                      //     pdfUrl: chap.pdfUrl,
                      //     title: chap.title,
                      //   ),
                      // );
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
                            'Chapter ${chapter.chapternum.toString()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            chapter.title,
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
