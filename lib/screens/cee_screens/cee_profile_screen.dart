import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/cee_switch_controller.dart';
import 'package:psc_app/widgets/cee_widgets/cee_setting_widget.dart';
import 'package:psc_app/widgets/cee_widgets/profile_header.dart';

class CeeProfileScreen extends StatelessWidget {
  const CeeProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final switchController = Get.put(CeeSwitchController());
    return
    
    
     Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 20),
            Text(
              "Settings",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            CeeSettingWidget(
              title: "Switch Course",
              description: "You have chosen CEE Course",
              icon: Icons.swap_horizontal_circle_outlined,
            ),

            SizedBox(height: 10),

            CeeSettingWidget(
              title: "Notification",
              description: "Push notifications and reminders",
              icon: Icons.notifications,
              switchIcon: true,
              isDark: false,
              onclick: (value) {
                switchController.setNotification(value);
              },
            ),

            SizedBox(height: 10),

            CeeSettingWidget(
              title: "App Theme",
              description: "Light and Dark",
              icon: Icons.dark_mode_outlined,
              switchIcon: true,
              isDark: true,
              onclick: (value) {
                return switchController.setDart(value);
              },
            ),

            SizedBox(height: 10),

            CeeSettingWidget(
              title: "Help and Support",
              icon: Icons.help_outline_sharp,
            ),

            SizedBox(height: 10),

            CeeSettingWidget(
              title: "Privacy and Policies",
              icon: Icons.privacy_tip_outlined,
            ),

            SizedBox(height: 10),
            CeeSettingWidget(title: "About us", icon: Icons.details_outlined),
          ],
        ),
      ),
    );
  }
}
