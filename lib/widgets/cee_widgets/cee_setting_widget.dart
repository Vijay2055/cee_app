import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/controller/cee_controller/cee_switch_controller.dart';

class CeeSettingWidget extends StatelessWidget {
  const CeeSettingWidget({
    super.key,
    required this.title,
    this.description,
    required this.icon,
    this.switchIcon = false,
    this.onclick,
    this.isDark,
  });
  final String title;
  final String? description;
  final bool switchIcon;
  final IconData icon;
  final bool? isDark;
  final Function(bool value)? onclick;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CeeSwitchController>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(55, 59, 10, 102),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, color: const Color.fromARGB(70, 25, 41, 216)),
          ),

          SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                if (description != null)
                  Text(description!, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          if (switchIcon == false)
            Icon(Icons.arrow_forward_ios_outlined, size: 18),
          if (switchIcon == true)
            Obx(() {
              return Switch(
                value: isDark == true
                    ? controller.isDark.value
                    : controller.isNotification.value,
                onChanged: onclick,
              );
            }),
        ],
      ),
    );
  }
}
