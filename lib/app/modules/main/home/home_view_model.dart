import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/core/services/storage_service.dart';
import 'package:psc_app/app/data/models/course_model.dart';
import 'package:psc_app/app/data/models/quote_model.dart';
import 'package:psc_app/app/data/repository/course_repository/course_repository.dart';
import 'package:psc_app/app/data/repository/quotes_repository.dart';
import 'package:psc_app/app/routes/app_routes.dart';

class HomeViewModel extends GetxController {
  final StorageService _service;

  final currentPage = 0.obs;
  final pageController = PageController();
  final QuotesRepository _quoteRepository;
  final CourseRepository _courseRepository;

  Timer? timer;

  HomeViewModel(this._service, this._quoteRepository, this._courseRepository);

  final _userName = Rxn<String>();
  String get userName => _userName.value ?? "Guest";
  @override
  void onInit() async {
    // TODO: implement onInit
    _userName.value = _service.name;
    await fetchQuote();
    await fetchCourse();
    super.onInit();
  }

  // for quotes
  final quotes = <QuoteModel>[].obs;
  final isLoadingQuotes = false.obs;

  // courses

  final course = <CourseModel>[].obs;
  final isCourseisLoading = false.obs;

  void onCourseSelect(String? value) {
    if (value == null || value.isEmpty) {
      Get.snackbar("Error", "Course id is error");
      return;
    }
    Get.toNamed(Routes.CATAGORY, arguments: value);
  }

  void onPageChange(int index) {
    currentPage.value = index;
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

  // get the course

  Future<void> fetchCourse() async {
    isCourseisLoading.value = true;
    final result = await _courseRepository.getCourses();
    isCourseisLoading.value = false;
    if (!result.isSuccess) {
      Get.snackbar("Error", result.error ?? "Some thing went wrong");
      print(result.error);
      return;
    }
    if (result.data != null) {
      course.value = result.data!;
    } else {
      course.value = [];
    }
  }

  Future<void> fetchQuote() async {
    isLoadingQuotes.value = true;
    final result = await _quoteRepository.getQuotes(20);
    isLoadingQuotes.value = false;

    if (!result.isSuccess) {
      Get.snackbar("Errorr", result.error ?? "Something went wrong");

      return;
    }
    if (result.data != null) {
      quotes.value = result.data!;
      _autoScroll();
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
