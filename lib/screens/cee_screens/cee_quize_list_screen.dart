import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/screens/cee_screens/cee_quize_screen.dart';
import 'package:psc_app/widgets/custom_app_bar.dart';

class CeeQuizeListScreen extends StatelessWidget {
  const CeeQuizeListScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: Column(
        children: [
          CustomAppBar(title: title),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: 10,

              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 12,
                    bottom: 10,
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Set-1",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Questions 15",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: const Color.fromARGB(255, 17, 5, 5),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  "Time: 30min",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: const Color.fromARGB(255, 17, 5, 5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(CeeQuizeScreen(title: title));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              204,
                              57,
                              128,
                              186,
                            ),
                            foregroundColor: const Color.fromARGB(
                              227,
                              255,
                              255,
                              255,
                            ),
                          ),
                          child: Text("Play"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
