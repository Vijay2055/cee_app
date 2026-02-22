import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psc_app/constants/app_images.dart';
import 'package:psc_app/controller/selected_area_controller.dart';
import 'package:psc_app/screens/cee_screens/cee_detail_screens.dart';
import 'package:psc_app/screens/course_screen.dart';
import 'package:psc_app/utility/get_greeting.dart';
import 'package:psc_app/view_model/auth_view_model.dart';
import 'package:psc_app/widgets/custom_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildItem(String role) {
    if (role == 'CEE') {
      return CeeDetailScreens();
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => CourseScreen(title: "नेपाल लोक सेवा आयोग"));
                },
                child: CustomInfoCard(
                  height: 0.38,
                  width: 0.45,
                  color: const Color(0xFF67ACFF),
                  title: 'Nepal Lok Sewa Ayog',
                  subtitle: '2000 Questions',
                ),
              ),
              const SizedBox(width: 7),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CeeDetailScreens());
                    },
                    child: CustomInfoCard(
                      height: 0.18,
                      width: 0.40,
                      color: const Color(0xFFB7A3FE),
                      title: 'Cee Course',
                      subtitle: '500 questions',
                    ),
                  ),
                  const SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => CourseScreen(title: "Engineering Preparation"),
                      );
                    },
                    child: CustomInfoCard(
                      height: 0.18,
                      width: 0.40,
                      color: const Color(0xFF5BCECB),
                      title: 'Engineering Preparation',
                      subtitle: '400 questions',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "See More",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF67ACFF),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authView = Get.find<AuthViewModel>();
    final roleController = Get.find<SelectedAreaController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea( 
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage:
                            const AssetImage(AppImages.profileImg)
                                as ImageProvider,
                      ),
                      title: Text(
                        getGreeting(),
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF7B7B7B),
                        ),
                      ),
                      subtitle: Text(
                        authView.userName.value,
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),

                      trailing: Image.asset(AppImages.notificationn),
                    ),
                    SizedBox(height: 30),

                    // ListView.builder(
                    //   itemCount: customCardList.length,

                    //   itemBuilder: (context, index){
                    //     final current=customCardList[index];
                    //     return CustomInfoCard(height: current.height , width: current.width, color: color, title: title, subtitle: subtitle)

                    // },
                    // )
                    Obx(() {
                      if (roleController.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return _buildItem(roleController.selectedArea.value);
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
