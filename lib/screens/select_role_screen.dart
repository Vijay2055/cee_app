import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psc_app/constants/app_images.dart';
import 'package:psc_app/controller/selected_area_controller.dart';

import 'package:psc_app/utility/get_greeting.dart';
import 'package:psc_app/view_model/auth_view_model.dart';
import 'package:psc_app/widgets/app_button.dart';
import 'package:psc_app/widgets/bottom_nav_widget.dart';
import 'package:psc_app/widgets/custom_dropdown_field.dart';

class SelectRoleScreen extends StatelessWidget {
  SelectRoleScreen({super.key});

  final selectRoleController = Get.find<SelectedAreaController>();
  final authView = Get.find<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            ListTile(
              leading: Image.asset(AppImages.profileImg),
              title: Text(
                getGreeting(),
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF7B7B7B),
                ),
              ),
              subtitle: Obx(
                () => Text(
                  authView.userName.value,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              trailing: Image.asset(AppImages.notificationn),
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Profession',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF101828),
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'Select the one role from the following',
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF475467),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Preparation for',
              style: GoogleFonts.workSans(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF475467),
              ),
            ),
            SizedBox(height: 10),

            Obx(
              () => CustomDropdownField(
                hintText: "What preparation are you doing?",
                selectedValue: selectRoleController.selectedArea.value.isEmpty
                    ? null
                    : selectRoleController.selectedArea.value,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Image.asset(
                    'assets/icons/layer.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                items: selectRoleController.interests
                    .map(
                      (item) =>
                          DropdownMenuItem(value: item, child: Text(item)),
                    )
                    .toList(),
                onChanged: (value) {
                  selectRoleController.selectedArea.value = value!;
                },
              ),
            ),

            Spacer(),

            PrimaryButton(
              text: "Go to Home",
              onPressed: () {
                selectRoleController.submitInterest();

                Get.offAll(BottomNavScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
