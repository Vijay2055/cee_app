import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CeeCustomCard extends StatelessWidget {
  CeeCustomCard({
    super.key,
    this.height = 0.18,
    this.width = 0.18,
    required this.color,
    required this.title,
    required this.icon,
    required this.onTypeSelect,
  });
  final double height;
  final double width;
  final Color color;
  final String title;
  final IconData icon;
  Function() onTypeSelect;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTypeSelect,
      child: Container(
        height: height * screenHeight,
        width: width * screenWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: Icon(icon, color: Colors.white)),
                    SizedBox(height: 4),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
