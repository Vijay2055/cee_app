import 'package:psc_app/data/services/cee_services/notes_services.dart';
import 'package:psc_app/model/cee_model/chapter_model.dart';

class NotesRepository {
  final NotesServices _services = NotesServices();

  Future<List<Chapter>> getChapters(String category, String subcategory) async {
    final data = await _services.fetchDocument(
      collection: 'cee_content',
      filters: {"category": category, "subcategory": subcategory},
    );
    return data.map((e) => Chapter.fromJson(e, e['id'])).toList();
  }

  Future<List<PastYearPaper>> getPastYearPaper() async {
    final data = await _services.fetchPastyearQuestionDocs(
      collectionId: 'past_year_question_paper',
    );

    return data.map((e) => PastYearPaper.fromJson(e, e['id'])).toList();
  }
}
