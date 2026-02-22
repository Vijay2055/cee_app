import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CeeCustomListTiles extends StatelessWidget {
  const CeeCustomListTiles({
    super.key,
    required this.description,
    required this.title,
    required this.onTap,
    this.iconBgColor = const Color(0xFFF6F8FA),
    this.icon = Icons.quiz,
  });
  final String title;
  final String description;
  final Function() onTap;
  final Color iconBgColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: iconBgColor,
          radius: 24,
          child: Icon(icon, color: Colors.grey, size: 26),
        ),
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          description,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8A8A8A),
          ),
        ),

        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          child: Text("Play now"),
        ),
      ),
    );
  }
}
