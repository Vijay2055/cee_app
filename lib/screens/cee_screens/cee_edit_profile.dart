import 'package:flutter/material.dart';
import 'package:psc_app/widgets/cee_widgets/cee_editprofileTextField.dart';
import 'package:psc_app/widgets/cee_widgets/edit_userprofile.dart';

class CeeEditProfile extends StatelessWidget {
  const CeeEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0XFFFFFFFF),
        elevation: 0,

        leadingWidth: 25,
        title: Text(
          "Back",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditUserprofile(),
              CeeEditprofiletextfield(
                heading: "Your Name",
                hint: "Sandip Yadav",
              ),
              SizedBox(height: 20),
              CeeEditprofiletextfield(
                heading: "Your email",
                hint: "Sandy@gmail.com",
              ),
              SizedBox(height: 20),
              CeeEditprofiletextfield(
                heading: "Phone Number",
                hint: "9811917936",
              ),

              SizedBox(height: 20),
              CeeEditprofiletextfield(heading: "Role", hint: "CEE"),

              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color.fromARGB(255, 20, 136, 213),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Complete",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
