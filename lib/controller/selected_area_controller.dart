import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psc_app/data/repository/user_repository.dart';

class SelectedAreaController extends GetxController {
  final interests = ['Public Service Commission', "Engineering", "MBBS", 'CEE'];
  final selectedArea = ''.obs;
  final isLoading = false.obs;
  final userRepository = UserRepository();
  final box = GetStorage();

  Future<void> submitInterest() async {
    if (selectedArea.value.isEmpty) {
      Get.snackbar("Error", "Please select a field");
      return;
    }

    try {
      isLoading.value = true;
      final uuid = FirebaseAuth.instance.currentUser?.uid;

      if (uuid != null) {
        await userRepository.updateArea(uuid, selectedArea.value);
        box.write("isRoleSelected", true);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getRole() async {
    try {
      String? role = await userRepository.getUserRole();
      if (role != null) {
        selectedArea.value = role;
      }
    } catch (e) {
      Get.snackbar("Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRole();
  }
}
