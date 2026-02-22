import 'package:flutter/material.dart';
import 'package:psc_app/constants/app_images.dart';
import 'package:psc_app/widgets/auth_bottom_sheet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.onboarding1,
      "title": "Welcome to Workmate!",
      "description":
          "Make Smart Decisions! Set clear timelines for projects and celebrate your achievements!",
    },
    {
      "image": AppImages.onboarding2,
      "title": "Manage Stress Effectively",
      "description":
          "Stay Balanced! Track your workload and maintain a healthy stress level with ease.",
    },
    {
      "image": AppImages.onboarding3,
      "title": "Plan for Success",
      "description":
          "Your Journey Starts Here! Earn achievement badges as you conquer your tasks. Let’s get started!",
    },
    {
      "image": AppImages.onboarding4,
      "title": "Navigate Your Work Journey Efficient & Easy",
      "description":
          "Increase your work management & career development radically",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7A5AF8), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1891, 1.0],
          ),
        ),
        child: Column(
          children: [
            // page viewer
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(data['image']!, height: 300),
                          const SizedBox(height: 30),
                          Text(
                            data['title']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            data['description']!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff475467),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Page indicator
            SmoothPageIndicator(
              controller: _controller,
              count: onboardingData.length,
              effect: ExpandingDotsEffect(
                expansionFactor: 3.5, // Controls how wide the active dot gets
                dotWidth: 10,
                dotHeight: 6,
                radius: 8, // Makes it pill/rounded shape
                spacing: 8,
                dotColor: Color(0xFFD9D9D9), // Inactive dot color
                activeDotColor: Color(0xFF7A5AF8), // Active dot color
              ),
            ),

            const SizedBox(height: 30),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  // Gradient button with border and shadow
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF8862F2),
                          Color(0xFF7544FC),
                          Color(0xFF5B2ED5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF6938EF),
                          blurRadius: 0,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex < onboardingData.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          // Navigate to home or login
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) =>
                                const AuthBottomSheet(isLogin: true),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        minimumSize: const Size.fromHeight(50),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        currentIndex == onboardingData.length - 1
                            ? "Sign In"
                            : "Next",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Skip button
                  OutlinedButton(
                    onPressed: () {
                      if (currentIndex < onboardingData.length - 1) {
                        setState(() {
                          currentIndex = onboardingData.length - 1;
                        });
                      } else {
                        // Navigate to home or login
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          builder: (context) =>
                              const AuthBottomSheet(isLogin: false),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF7A5AF8)),
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      currentIndex == onboardingData.length - 1
                          ? "Sign Up"
                          : "Skip",
                      style: GoogleFonts.roboto(
                        color: const Color(0xFF7A5AF8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
