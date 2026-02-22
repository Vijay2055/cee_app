import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psc_app/controller/cee_controller/quote_controller.dart';

class QuoteBanner extends StatelessWidget {
  QuoteBanner({super.key});
  final controller = Get.find<QuoteController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 180, // banner height
        child: PageView.builder(
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
      );
    });
  }
}
