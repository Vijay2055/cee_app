import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:psc_app/model/cee_model/cee_quize_model.dart';
import 'package:psc_app/screens/cee_screens/cee_quize_list_screen.dart';

class CeeQuizeCategoryScreen extends StatelessWidget {
  const CeeQuizeCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
            bottom: 20,
          ),
          child: Text(
            "Play Quiz",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.quiz_outlined, size: 30, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20),
        itemCount: listOfCeeCategory.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: ListTile(
              onTap: () {
                Get.to(
                  CeeQuizeListScreen(title: listOfCeeCategory[index].category),
                );
              },
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),

              shape: RoundedRectangleBorder(
                side: BorderSide(color: const Color(0xFFE8E8E8)),
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              leading: Icon(listOfCeeCategory[index].icon, color: Colors.blue),
              title: Text(
                listOfCeeCategory[index].category,
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 15),
            ),
          );
        },
      ),
    );
  }
}
