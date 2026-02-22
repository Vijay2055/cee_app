import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/model/cee_model/cee_queiton_model.dart';
import 'package:psc_app/screens/cee_screens/cee_result_screen.dart';

class CeeQuizeController extends GetxController {
  static final int totalLength = dummyMcqList.length;
  final current_index = 0.obs;
  static const int totalTimeInSec = 60;
  final timeLeft = totalTimeInSec.obs;
  final isSound = true.obs;
  final isSelected = false.obs;
  int totalCorrectAns = 0;
  Timer? _timer;
  final optionColors = <Color>[].obs;

  final mcq = Rx<CeeQuestionModel>(dummyMcqList[0]);
  void nextQuestion(int index) {
    if (mcq.value.options[index] == mcq.value.options[mcq.value.answer]) {
      totalCorrectAns++;
      print("Ans is Correct");
    }
    isSelected.value = true;
    optionColors[index] = Colors.green;
    Future.delayed(Duration(milliseconds: 500), () {
      if (current_index.value < totalLength - 1) {
        current_index.value++;
        mcq.value = dummyMcqList[current_index.value];
        restart();
      } else {
        current_index.value = 0;
        mcq.value = dummyMcqList[current_index.value];
        Get.off(() => CeeResultScreen(correctAns: totalCorrectAns));
      }
      resetColor();
      isSelected.value = false;
    });
  }

  void resetColor() {
    optionColors.value = List.generate(
      mcq.value.options.length,
      (index) => const Color(0XFFF6F6F6),
    );
  }

  void restart() {
    timeLeft.value = totalTimeInSec;
    cancelTimer();
    startTimer();
  }

  void startCountdown() async {
    final _player = AudioPlayer();
    await _player.play(AssetSource('sounds/countdown.mp3'));
  }

  void setSound() {
    isSound.value = !isSound.value;
    if (isSound.value == true && (timeLeft.value < 10 && timeLeft.value > 0)) {
      startCountdown();
    }
    // else if (isSound.value == false) {
    //   stopPlayer();
    // }
  }

  void startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        if (timeLeft.value == 10 && isSound.value) {
          startCountdown();
        }
        timeLeft.value--;
      } else {
        // stopPlayer();
        timer.cancel();
      }
    });
  }

  // Future<void> stopPlayer() async {
  //   await _player.stop();
  // }

  String get timerText {
    int min = timeLeft.value ~/ 60;
    int sec = timeLeft.value % 60;
    String secString = '$sec';
    if (sec < 10) {
      secString = '0$sec';
    }

    return '0$min:$secString';
  }

  double get progress => timeLeft.value / totalTimeInSec;

  void cancelTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    resetColor();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    // _player.dispose();
    if (_timer != null) {
      _timer?.cancel();
    }
  }
}
