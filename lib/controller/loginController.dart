import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class Logincontroller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final nameController = TextEditingController();

  bool validateSignUpForm() {
    if (emailController.text.isEmpty) {
      Get.snackbar("Email", "Please enter email");
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar("Password", "Please enter password");
      return false;
    }

    if (nameController.text.isEmpty || nameController.text.isNum) {
      Get.snackbar("Name", "Name field is required!");
      return false;
    }

    if (confirmPassController.text.isEmpty ||
        confirmPassController.text.trim() != passwordController.text.trim()) {
      Get.snackbar(
        "Password Confirmation",
        "Password did't matched. Please confirm with password",
      );
      return false;
    }

    return true;
  }

  bool validateSignInForm() {
    if (emailController.text.isEmpty) {
      Get.snackbar("Email", "Please enter email");
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar("Password", "Please enter password");
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    nameController.dispose();
    confirmPassController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
