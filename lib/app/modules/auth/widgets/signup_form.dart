import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psc_app/app/modules/auth/auth_view.dart';
import 'package:psc_app/constants/app_images.dart';
import 'package:psc_app/widgets/app_button.dart';

class SignupForm extends GetView<AuthViewModel> {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Create an account",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Employee ID
              Text(
                "Fullname",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475467),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.nameCtrl,
                enabled: !controller.isLoading.value,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  if (!GetUtils.isUsername(value)) {
                    return 'Enter valid username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter fullname',
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

              Text(
                "Enter email",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475467),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.emailCtrl,
                keyboardType: TextInputType.emailAddress,
                enabled: !controller.isLoading.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
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

              Text(
                "Mobile",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF475467),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.mobileCtrl,
                keyboardType: TextInputType.phone,
                enabled: !controller.isLoading.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!GetUtils.isPhoneNumber(value)) {
                    return 'Enter valid phone number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter mobile',
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
                () => TextFormField(
                  controller: controller.passwordCtrl,
                  enabled: !controller.isLoading.value,
                  obscureText: controller.isHidePassword.value,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Create Password',
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
                        controller.isHidePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF67ACFF),
                      ),
                      onPressed: controller.setHidePassword,
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

              Obx(
                () => TextFormField(
                  controller: controller.confirmPassCtr,
                  enabled: !controller.isLoading.value,
                  obscureText: controller.isHidePassword.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm password';
                    }
                    if (value != controller.passwordCtrl.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
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
                        controller.isHidePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF67ACFF),
                      ),
                      onPressed: controller.setHidePassword,
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
                      value: controller.isRemember.value,

                      onChanged: controller.isLoading.value
                          ? null
                          : controller.setRememberMe,
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
                ],
              ),

              const SizedBox(height: 20),

              Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 4),
                            ),
                            SizedBox(height: 5),
                            Text("Please wait.."),
                          ],
                        ),
                      )
                    : PrimaryButton(
                        text: "Sign Up",
                        onPressed: controller.register,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
