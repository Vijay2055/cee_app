import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTiles extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final String buttonLabel;
  final Function() onTap;

  const CustomListTiles({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.settings_rounded,
    this.iconBgColor = const Color(0xFFF6F8FA),
    this.buttonLabel = 'Start',
    required this.onTap,
  });

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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8A8A8A),
          ),
        ),
      ),
    );
  }
}
