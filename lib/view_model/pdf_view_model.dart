import 'package:get/get.dart';
import 'package:psc_app/data/repository/pdf_repository.dart';
import 'package:psc_app/model/pdf_model.dart';

class PdfViewModel extends GetxController {
  final isLoading = false.obs;
  final _pdfRepository = PdfRepository();

  final pdfData = Rxn<List<PdfModel>>();

  Future<void> getPdfData(String pdfId) async {
    isLoading.value = true;
    try {
      final data = await _pdfRepository.getPdf(pdfId);
    
        pdfData.value = data;
      
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
