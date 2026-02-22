import 'package:psc_app/data/services/pdf_service.dart';
import 'package:psc_app/model/pdf_model.dart';

class PdfRepository {
  final _pdfService = PdfService();

  Future<List<PdfModel>> getPdf(String url) {
    return _pdfService.getPdfUrl(url);
  }
}
