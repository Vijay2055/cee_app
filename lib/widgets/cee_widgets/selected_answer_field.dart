import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/mcq_controller.dart';

class SelectAnswerField extends StatelessWidget {
  const SelectAnswerField({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<McqController>();
    return Obx(() {
      var ind = '';
      var indColor = Colors.transparent;
      switch (index) {
        case 0:
          indColor = const Color(0XFFF9DADB);
          ind = 'a';
          break;
        case 1:
          ind = 'b';
          indColor = const Color(0XFFCBC9D9);
          break;
        case 2:
          ind = 'c';
          indColor = const Color(0XFFF3D1EF);
          break;
        case 3:
          ind = 'd';
          break;
      }
      return GestureDetector(
        onTap: controller.isCorrect.value
            ? null
            : () {
                controller.setIsCorrect(index);
              },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 60,
          padding: EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: controller.optionColors[index],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,

                alignment: Alignment.center,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: indColor,
                ),
                child: Text(ind),
              ),
              SizedBox(width: 10),
              Expanded(child: Text(controller.mcq.value.options[index])),
            ],
          ),
        ),
      );
    });
  }
}
