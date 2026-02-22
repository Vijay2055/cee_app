import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psc_app/controller/bottom_nav_controller.dart';

import 'package:psc_app/screens/discussion_screen.dart';
import 'package:psc_app/screens/profile_screen.dart';
import 'package:psc_app/screens/quize_screen.dart';

import '../app/modules/home/home_screen.dart';



class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    const HomeScreen(),
    const QuizeScreen(),
    DiscussionScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Obx(
      () => SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,

          body: PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),

          bottomNavigationBar: Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: bottomPadding > 0 ? bottomPadding : 16,
            ),
            height: 65,
            decoration: BoxDecoration(
              color: const Color(0xFF67ACFF),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: (index) {
                  // if (index == 4) {
                  //   // 👉 Navigate to Create Client screen
                  //   Get.to(() => CreateNewClientScreen());
                  // } else {
                  controller.onItemTapped(index);
                  // }
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white70,
                selectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/shape1.png',
                      width: 24,
                      height: 24,
                      color: controller.selectedIndex.value == 0
                          ? Colors.white
                          : Colors.white70,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/shape2.jpg',
                      width: 24,
                      height: 24,
                      color: controller.selectedIndex.value == 1
                          ? Colors.white
                          : Colors.white70,
                    ),
                    label: 'Play Quize',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/shape.png',
                      width: 24,
                      height: 24,
                      color: controller.selectedIndex.value == 2
                          ? Colors.white
                          : Colors.white70,
                    ),
                    label: 'Discuss',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/icons/profileIc.png',
                      width: 24,
                      height: 24,
                      color: controller.selectedIndex.value == 3
                          ? Colors.white
                          : Colors.white70,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
