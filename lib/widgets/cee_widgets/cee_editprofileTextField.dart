import 'package:flutter/material.dart';

class CeeEditprofiletextfield extends StatefulWidget {
  const CeeEditprofiletextfield({
    super.key,
    required this.heading,
    required this.hint,
  });
  final String heading;
  final String hint;

  @override
  State<CeeEditprofiletextfield> createState() =>
      _CeeEditprofiletextfieldState();
}

class _CeeEditprofiletextfieldState extends State<CeeEditprofiletextfield> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 3),
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped = true;
              print("tapped");
            });
          },
          child: isTapped == true
              ? TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hint: Text(widget.hint),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.hint,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: const Color.fromARGB(255, 56, 11, 8),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
