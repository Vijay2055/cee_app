import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/selected_area_controller.dart';
import 'package:psc_app/data/repository/auth_repository.dart';
import 'package:psc_app/data/repository/user_repository.dart';
import 'package:psc_app/model/user_model.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _authRepository = Get.find();
  final UserRepository _userRepository = UserRepository();

  final isLoading = false.obs;
  final rememberMe = false.obs;
  final isPasswordHidden = true.obs;
  final userName = ''.obs;
  final isConfirmPasswoedHidden = true.obs;

  final isNewUser = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadUserName();
    super.onInit();
  }

  void tooglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toogleConfirmPasswordVisibility() {
    isConfirmPasswoedHidden.value = !isConfirmPasswoedHidden.value;
  }

  void toogleRemember(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> signUp(String email, String password, String name) async {
    try {
      isLoading.value = true;
      final userCredential = await _authRepository.register(email, password);
      final user = UserModel(
        email: email,
        id: userCredential.user!.uid,
        name: name,
      );

      await _userRepository.storeUser(user);

      await loadUserName();
      Get.back();
      Get.snackbar("Account", "Account creation Successful");
      // Close keyboard if open
      FocusScope.of(Get.context!).unfocus();
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  signIn(String email, String password) async {
    try {
      isLoading.value = true;
      final user = await _authRepository.login(email, password);
      // Close keyboard if open
      FocusScope.of(Get.context!).unfocus();
      loadUserName();

      Get.back();
      print(user);
      Get.snackbar("Sign In", "Sign In Successful");
    } catch (e) {
      Get.snackbar("Sign In Fail", e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadUserName() async {
    try {
      final name = await _userRepository.getUserName();
      if (name != null) {
        userName.value = name;
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load user name");
    }
  }

  signOut() async {}
}
