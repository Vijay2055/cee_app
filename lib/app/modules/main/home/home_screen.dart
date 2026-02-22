import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psc_app/app/modules/main/home/home_view_model.dart';
import 'package:psc_app/app/modules/main/home/widgets/course_widget.dart';
import 'package:psc_app/app/modules/main/home/widgets/quotes_widget.dart';
import 'package:psc_app/constants/app_images.dart';
import 'package:psc_app/utility/get_greeting.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        controller.userName,
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),

                      trailing: Image.asset(AppImages.notificationn),
                    ),
                    SizedBox(height: 30),

                    QuotesWidget(),

                    // course secreen
                    SizedBox(height: 10),
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    CourseWidget(),
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
