import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:psc_app/app/modules/main/home/home_view_model.dart';

class QuotesWidget extends GetView<HomeViewModel> {
  const QuotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // banner height
      child: Obx(
        () => PageView.builder(
          onPageChanged: controller.onPageChange,
          controller: controller.pageController,
          itemCount: controller.quotes.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green, Colors.blue]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  controller.quotes[index].text,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
