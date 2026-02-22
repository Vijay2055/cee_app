import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psc_app/model/pdf_model.dart';

class PdfService {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<PdfModel>> getPdfUrl(String docId) async {
    final doc = await _fireStore
        .collection('pdfs')
        .doc('psc')
        .collection(docId)
        .get();

    return doc.docs.map((doc) {
      final data = doc.data();
      return PdfModel.fromMap(data);
    }).toList();
  }
}
