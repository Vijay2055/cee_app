import 'package:psc_app/data/services/cee_services/cee_firebase_services.dart';

class CeeMcqRepository {
  final _services = CeeFirebaseServices();

  Future<List<String>> loadCategory(String title) {
    return _services.loadCategoryOfMcq(title);
  }
}
