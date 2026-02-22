import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:psc_app/app/modules/auth/auth_view.dart';
import 'package:psc_app/app/modules/auth/widgets/login_form.dart';
import 'package:psc_app/app/modules/auth/widgets/signup_form.dart';

class AuthScreen extends GetView<AuthViewModel> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Obx(
            () => controller.mode.value == AuthMode.login
                ? LoginForm()
                : SignupForm(),
          ),
        ),
      ),
    );
  }
}
