import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:psc_app/data/repository/cee_repository/quote_repository.dart';
import 'package:psc_app/model/cee_model/quote_model.dart';

class QuoteController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();
  final QuoteRepository quoteRepository;
  Timer? timer;

  QuoteController({required this.quoteRepository});

  final quotes = <QuoteModel>[].obs;
  final isLoading = false.obs;

  void onPageChange(int index) {
    currentPage.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    fetchQuote();
  }

  void _autoScroll() {
    if (quotes.isEmpty) {
      return;
    }

    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentPage.value < quotes.length) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }

      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  Future<void> fetchQuote() async {
    try {
      isLoading.value = true;
      quotes.value = await quoteRepository.getQuotes(20);
      _autoScroll();
    } catch (e) {
      Get.snackbar("Error", "Error fetching the quotes $e");
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
    timer?.cancel();
  }
}
