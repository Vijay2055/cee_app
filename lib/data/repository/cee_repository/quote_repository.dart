import 'package:psc_app/data/services/cee_services/quote_service.dart';
import 'package:psc_app/model/cee_model/quote_model.dart';

class QuoteRepository {
  final QuoteService service;
  QuoteRepository({required this.service});

  Future<List<QuoteModel>> getQuotes(int limit) async {
  final data=  await service.getQuotes(limit: limit);

  return data.map((item)=>QuoteModel.fromJson(item)).toList();

  }
}
