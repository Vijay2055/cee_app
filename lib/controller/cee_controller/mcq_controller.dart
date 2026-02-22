import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psc_app/data/repository/cee_repository/cee_mcq_repository.dart';
import 'package:psc_app/model/cee_model/cee_queiton_model.dart';

import 'package:vibration/vibration.dart';

class McqController extends GetxController {
  final String title;
  final current_index = 0.obs;
  final isCategoryLoading = false.obs;

  final isCorrect = false.obs;
  final optionColors = <Color>[].obs;
  final isShowDetail = false.obs;
  final AudioPlayer _player = AudioPlayer();
  final isSound = false.obs;
  final mcqRepository = CeeMcqRepository();
  final categories = <String>[].obs;

  McqController({required this.title});

  final mcq = Rx<CeeQuestionModel>(dummyMcqList[0]);

  void nextQuestion() async {
    stopSound();

    if (current_index.value < dummyMcqList.length - 1) {
      current_index.value++;
      mcq.value = dummyMcqList[current_index.value];
    } else {
      current_index.value = 0;
      mcq.value = dummyMcqList[current_index.value];
    }

    resetColor();
    isCorrect.value = false;
    isShowDetail.value = false;
  }

  @override
  void onInit() {
    
    loadCategory(title);
    super.onInit();
    resetColor();
  }

  Future<void> loadCategory(String title) async {
    try {
      isCategoryLoading.value = true;
      categories.value = await mcqRepository.loadCategory(title);
    } on FirebaseException catch (e) {
      Get.snackbar("Category", "Eror is due to $e");
    } finally {
      isCategoryLoading.value = false;
    }
  }

  void resetColor() {
    optionColors.value = List.generate(
      mcq.value.options.length,
      (index) => const Color(0XFFF6F6F6),
    );
  }

  Future<void> playAudio(String path, bool isWrite) async {
    await _player.play(AssetSource(path));
    if (!isWrite) {
      await _player.seek(const Duration(seconds: 1));
    }
  }

  void setIsCorrect(int ind) async {
    resetColor();

    if (mcq.value.answer == ind) {
      optionColors[ind] = Color(0xFF43A047);
      isCorrect.value = true;
      if (isSound.value) {
        await playAudio('sounds/right.mp3', true);
      }
    } else {
      optionColors[ind] = Color(0xFFE53935);
      if (isSound.value) {
        if (await Vibration.hasVibrator()) {
          Vibration.vibrate(duration: 1000); // short buzz
        }
        await playAudio('sounds/wrong_sound.mp3', false);
      }
    }
    optionColors.refresh();
  }

  Future<void> stopSound() async {
    await _player.stop();
  }

  void setShowDetail() {
    isShowDetail.value = !isShowDetail.value;
  }

  void setSound() {
    isSound.value = !isSound.value;
  }
}
