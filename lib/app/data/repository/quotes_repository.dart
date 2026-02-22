import 'package:firebase_storage/firebase_storage.dart';
import 'package:psc_app/app/core/services/firebase/user_services/quote_service.dart';
import 'package:psc_app/app/core/services/results/result.dart';
import 'package:psc_app/app/data/models/quote_model.dart';

class QuotesRepository {
  final QuoteService _service;
  const QuotesRepository(this._service);

  Future<Result<List<QuoteModel>>> getQuotes(int limit) async {
    try {
      final result = await _service.getQuotes(limit: limit);
      if (result.isNotEmpty) {
        return Result.success(
          result.map((item) => QuoteModel.fromJson(item.data(),id: item.id)).toList(),
        );
      } else {
        return Result.error("No Quotes found");
      }
    } on FirebaseException catch (e) {
      return Result.error(e.message ?? "GetQuote:: unknown error");
    } catch (e) {
      return Result.error("GetQuotes:: Error is due to $e");
    }
  }
}
