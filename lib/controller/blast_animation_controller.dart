import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class BlastAnimationController extends GetxController {
  late ConfettiController confettiController;

  var showBlast = false.obs;

  void startBlast() {
    showBlast.value = true;
    confettiController.play();

    Future.delayed(confettiController.duration, () {
      showBlast.value = false;
    });
  }

  void stopBlast() {
    confettiController.stop();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    startBlast();
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    confettiController.dispose();
    super.onClose();
  }
}
