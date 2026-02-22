import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psc_app/constants/app_images.dart';
import 'package:psc_app/controller/loginController.dart';
import 'package:psc_app/view_model/auth_view_model.dart';
import 'package:psc_app/widgets/app_button.dart';

class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({super.key, required this.isLogin});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final loginVc = Get.find<Logincontroller>();
    
    final authView = Get.find<AuthViewModel>();
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: 
      
      
      SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  isLogin ? "Sign In" : 'Sign Up',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  isLogin ? "Sign in to your account" : "Create an account",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Employee ID
              Text(
                "Name",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475467),
                ),
              ),
              const SizedBox(height: 10),

              if (!isLogin)
                TextField(
                  controller: loginVc.nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Enter full name',
                    hintStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF98A2B3),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(AppImages.employeeIcon),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                  ),
                ),

              SizedBox(height: 12),

              /// Employee ID
              Text(
                "Email Address",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475467),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: loginVc.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF98A2B3),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(AppImages.employeeIcon),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// Password
              Text(
                "Password",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475467),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => TextField(
                  controller: loginVc.passwordController,
                  obscureText: authView.isPasswordHidden.value,
                  decoration: InputDecoration(
                    hintText: isLogin ? 'Enter password' : 'Create Password',
                    hintStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF98A2B3),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(AppImages.passwordIcon),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        authView.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFF67ACFF),
                      ),
                      onPressed: authView.tooglePasswordVisibility,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

              /// Password
              Text(
                "Confirm",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475467),
                ),
              ),
              const SizedBox(height: 10),

              if (!isLogin)
                Obx(
                  () => TextField(
                    controller: loginVc.confirmPassController,
                    obscureText: authView.isConfirmPasswoedHidden.value,
                    decoration: InputDecoration(
                      hintText: 'Re-enter password',
                      hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF98A2B3),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(AppImages.passwordIcon),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          authView.isConfirmPasswoedHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFF67ACFF),
                        ),
                        onPressed: authView.toogleConfirmPasswordVisibility,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              /// Remember Me and Forgot Password
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: authView.rememberMe.value,
                      onChanged: authView.toogleRemember,
                      activeColor: const Color(0xFF67ACFF),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Remember me",
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  if (isLogin)
                    TextButton(
                      onPressed: () {
                        // TODO: Implement Forgot Password logic
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF67ACFF),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 20),

              /// Login Button
              authView.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : PrimaryButton(
                      text: isLogin ? "Sign In" : "Sign Up",
                      onPressed: () async {
                        final empId = loginVc.emailController.text.trim();
                        final password = loginVc.passwordController.text.trim();

                        if (empId.isEmpty || password.isEmpty) {
                          Get.snackbar("Error", "Please fill all fields");
                        } else {
                          if (isLogin) {
                            if (loginVc.validateSignInForm()) {
                              authView.signIn(
                                loginVc.emailController.text.trim(),
                                loginVc.passwordController.text.trim(),
                              );
                            }
                          } else {
                            if (loginVc.validateSignUpForm()) {
                              authView.signUp(
                                loginVc.emailController.text.trim(),
                                loginVc.passwordController.text.trim(),
                                loginVc.nameController.text.trim(),
                              );
                            }

                            
                            return;
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
