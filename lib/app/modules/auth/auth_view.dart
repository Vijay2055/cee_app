import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psc_app/app/core/services/storage_service.dart';
import 'package:psc_app/app/data/repository/auth_repository/firebase_auth_repository.dart';
import 'package:psc_app/app/data/repository/user_repository/fire_base_user_repository.dart';
import 'package:psc_app/app/routes/app_routes.dart';

enum AuthMode { login, signup }

class AuthViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  final isRemember = false.obs;
  final isHidePassword = true.obs;

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final confirmPassCtr = TextEditingController();

  final mode = AuthMode.login.obs;

  final FireBaseUserRepository _userRepo;
  final FirebaseAuthRepository _authRepo;
  final StorageService _storageService;
  AuthViewModel(this._userRepo, this._authRepo, this._storageService);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mode.value = Get.arguments['mode'] ?? AuthMode.login;
  }

  void setRememberMe(bool? value) {
    if (value != null) {
      isRemember.value = value;
    }
  }

  void setHidePassword() {
    isHidePassword.value = !isHidePassword.value;
  }

  // user registration
  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    final result = await _authRepo.register(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text,
    );

    if (!result.isSuccess) {
      isLoading.value = false;
      Get.snackbar("Error", result.error ?? "Some thing went wrong");
      return;
    }

    if (result.data == null || result.data!.user == null) {
      Get.snackbar("Error", "Can't find user data");
      return;
    }

    final uuid = result.data!.user!.uid;

    final storeResult = await _userRepo.storeUser(
      uid: uuid,
      name: nameCtrl.text.trim(),
      mobile: mobileCtrl.text,
      email: emailCtrl.text,
    );
    isLoading.value = false;
    if (storeResult.isSuccess) {
      // go to the home or navaScreen
      await _storageService.storeUuid(uuid);
      await _storageService.saveUserName(nameCtrl.text.trim());
      Get.offAllNamed(Routes.MAIN);
    } else {
      Get.snackbar("Erorr", storeResult.error ?? "Can't store user");
    }
  }

  // user login
  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;

    final result = await _authRepo.login(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
    );

    if (!result.isSuccess) {
      isLoading.value = false;
      Get.snackbar("Error", result.error ?? "Something went wrong");
      return;
    }

    final uuid = result.data!.user!.uid;

    final userResult = await _userRepo.getUserData(uuid);

    if (!userResult.isSuccess && userResult.data == null) {
      isLoading.value = false;
      Get.snackbar(
        "Error while loading data",
        userResult.error ?? "Error while loading data",
      );
      return;
    }

    final user = userResult.data;

    if (user == null || user.uuid.isEmpty) {
      return;
    }

    await _storageService.storeUuid(user.uuid);
    await _storageService.saveUserName(user.name);

    isLoading.value = false;

    // go to navigation screen later
    Get.offAllNamed(Routes.MAIN);

    // go to the navigation screen
  }

  // for user logout
  Future<void> logout() async {
    isLoading.value = true;
    final result = await _authRepo.logout();
    isLoading.value = false;
    if (result.isSuccess) {
      // go to auth page
    } else {
      Get.snackbar("Error", result.error ?? "Can't logout");
    }
  }
}
