import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteService {
  final _storage = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getQuotes({int limit = 20}) async {
    try {
      final seed = Random().nextInt(1000);
      final response = await _storage
          .collection('quotes')
          .where('isActive', isEqualTo: true)
          .where('randomIndex', isGreaterThanOrEqualTo: seed)
          .limit(limit)
          .get();

     
      

      List<Map<String, dynamic>> quotes = response.docs
          .map((item) => item.data())
          .toList();

      if (quotes.length < limit) {
        final secondQuery = await _storage
            .collection('quotes')
            .where('isActive', isEqualTo: true)
            .where('randomIndex', isLessThan: seed)
            .limit(limit - quotes.length)
            .get();

        quotes.addAll(secondQuery.docs.map((item) => item.data()).toList());
      }

      return quotes;
    } catch (e) {
      throw Exception('Failed to fetch quotes: $e');
    }
  }
}
