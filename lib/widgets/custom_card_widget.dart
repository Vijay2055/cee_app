import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInfoCard extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String title;
  final String subtitle;

  const CustomInfoCard({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: height * screenHeight,
      width: width * screenWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                bottom: screenHeight * 0.025,
              ), // Push text up a bit
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.035,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}