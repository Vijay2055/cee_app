import 'package:get/get.dart';
import 'package:psc_app/app/core/services/firebase/course_service/course_service.dart';
import 'package:psc_app/app/core/services/firebase/user_services/quote_service.dart';
import 'package:psc_app/app/core/services/storage_service.dart';
import 'package:psc_app/app/data/repository/course_repository/course_repository.dart';
import 'package:psc_app/app/data/repository/quotes_repository.dart';
import 'package:psc_app/app/modules/main/home/home_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuoteService(), fenix: true);
    Get.lazyPut(() => QuotesRepository(Get.find<QuoteService>()), fenix: true);
    Get.lazyPut(() => CourseService());
    Get.lazyPut(() => CourseRepository(Get.find<CourseService>()), fenix: true);

    Get.lazyPut(
      () => HomeViewModel(
        Get.find<StorageService>(),
        Get.find<QuotesRepository>(),
        Get.find<CourseRepository>(),
      ),
      fenix: true,
    );
  }
}
