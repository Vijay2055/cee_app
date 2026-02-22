import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psc_app/app/core/services/firebase/user_services/firebase_auth_service.dart';
import 'package:psc_app/app/core/services/firebase/user_services/firebase_service.dart';
import 'package:psc_app/app/core/services/storage_service.dart';
import 'package:psc_app/app/data/repository/auth_repository/firebase_auth_repository.dart';
import 'package:psc_app/app/data/repository/user_repository/fire_base_user_repository.dart';

class Injection {
  static Future<void> init() async {
    Get.put(StorageService(GetStorage()), permanent: true);
    Get.lazyPut(() => FirebaseAuthService(), fenix: true);
    Get.lazyPut(() => FirebaseService(), fenix: true);
    Get.lazyPut(
      () => FireBaseUserRepository(Get.find<FirebaseService>()),
      fenix: true,
    );
    Get.lazyPut(
      () => FirebaseAuthRepository(Get.find<FirebaseAuthService>()),
      fenix: true,
    );
  }
}
