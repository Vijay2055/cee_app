import 'package:get/get.dart';

import 'package:psc_app/app/core/services/storage_service.dart';
import 'package:psc_app/app/data/repository/auth_repository/firebase_auth_repository.dart';
import 'package:psc_app/app/data/repository/user_repository/fire_base_user_repository.dart';
import 'package:psc_app/app/modules/auth/auth_view.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthViewModel(
        Get.find<FireBaseUserRepository>(),
        Get.find<FirebaseAuthRepository>(),
        Get.find<StorageService>(),
      ),
    );
  }
}
