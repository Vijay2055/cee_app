import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:psc_app/constants/app_images.dart';
import 'package:psc_app/controller/blast_animation_controller.dart';

import 'package:psc_app/widgets/cee_widgets/result_card.dart';

class CeeResultScreen extends StatelessWidget {
  const CeeResultScreen({super.key, required this.correctAns});
  final int correctAns;

  @override
  Widget build(BuildContext context) {
    final blastController = Get.put(BlastAnimationController());
    return Scaffold(
      backgroundColor: const Color(0XFFF2EAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(width: double.infinity, height: 550),

                      Obx(() {
                        return Positioned(
                          top: 250,
                          left: 0,
                          right: 0,
                          child: Opacity(
                            opacity: blastController.showBlast.value ? 0.0 : 1,
                            child: ResultCard(),
                          ),
                        );
                      }),

                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          AppImages.congratsImag,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      iconColor: const Color(0XFF250A59),
                      foregroundColor: const Color(0XFF250A59),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: const Color(0XFF856FA8),
                          width: 1.5,
                        ),
                      ),

                      backgroundColor: const Color(0XFFD5C0F9),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.repeat, size: 25),
                        SizedBox(width: 10),
                        Text("Try Again", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      iconColor: const Color(0XFFFFFFFF),
                      foregroundColor: const Color(0XFFFFFFFF),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: const Color(0XFF856FA8),
                          width: 1.5,
                        ),
                      ),

                      backgroundColor: const Color(0XFF632AC8),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.exit_to_app, size: 25),
                        SizedBox(width: 10),
                        Text("Exit", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),

              Obx(() {
                return Positioned(
                  top: 400,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    opacity: blastController.showBlast.value ? 1.0 : .0,
                    duration: Duration(milliseconds: 500),
                    child: Center(
                      child: Text(
                        "Congratulations",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 244, 220, 2),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                );
              }),

              Align(
                alignment: Alignment.bottomCenter,
                child: ConfettiWidget(
                  confettiController: blastController.confettiController,
                  blastDirection: -3.14 / 2, // upwards
                  emissionFrequency: 0.08,
                  numberOfParticles: 100,
                  gravity: 0.4,
                  shouldLoop: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
