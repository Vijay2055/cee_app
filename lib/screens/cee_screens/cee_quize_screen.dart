import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/cee_quize_controller.dart';
import 'package:psc_app/model/cee_model/cee_queiton_model.dart';
import 'package:psc_app/widgets/cee_widgets/quiz_selected_ans_field.dart';

class CeeQuizeScreen extends StatelessWidget {
  const CeeQuizeScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CeeQuizeController());
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, size: 18),
                      ),
                      SizedBox(width: 15),
                      Text(
                        title[0].toUpperCase() + title.substring(1),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Obx(() {
                    return IconButton(
                      onPressed: controller.setSound,
                      icon: Icon(
                        color: Colors.blue,
                        size: 25,
                        controller.isSound.value == true
                            ? Icons.volume_up
                            : Icons.volume_off,
                      ),
                    );
                  }),
                ],
              ),
            ),

            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Questions",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Obx(() {
                        return Row(
                          children: [
                            Text(
                              (controller.current_index.value + 1).toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: const Color(0XFFD035CE),
                              ),
                            ),
                            Text(
                              "/",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dummyMcqList.length.toString(),
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),

                  Obx(() {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Transform.rotate(
                            angle: -math.pi / 1,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                              backgroundColor: Colors.grey[300],
                              value: controller.progress,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue,
                              ),
                            ),
                          ),
                        ),

                        Text(
                          controller.timerText,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 24, 6, 6),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),

            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  children: List.generate(dummyMcqList.length, (index) {
                    return Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,

                        height: 6,
                        decoration: BoxDecoration(
                          borderRadius: index == 0
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                )
                              : index == dummyMcqList.length - 1
                              ? BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6),
                                )
                              : BorderRadius.zero,
                          color: index <= controller.current_index.value
                              ? Colors.blue
                              : Colors.grey[300],
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),

            Obx(() {
              return Container(
                constraints: BoxConstraints(minHeight: 100),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFFCDEF8),
                  border: Border.all(color: const Color(0XFFECB5E9)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  dummyMcqList[controller.current_index.value].question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              );
            }),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.mcq.value.options.length,
                  itemBuilder: ((ctx, index) {
                    return QuizSelectedAnsField(index: index);
                  }),
                ),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
