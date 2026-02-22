import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // for getting the quotes
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getQuotes({
    int limit = 20,
  }) async {
    final seed = Random().nextInt(1000);
    final snapShots = await _fireStore
        .collection('quotes')
        .where('isActive', isEqualTo: true)
        .where('randomIndex', isGreaterThan: seed)
        .limit(limit)
        .get();

    final quotes = snapShots.docs;

    if (quotes.length < limit) {
      final secondQuery = await _fireStore
          .collection("quotes")
          .where('isActive', isEqualTo: true)
          .where('randomIndex', isLessThan: seed)
          .limit(limit - quotes.length)
          .get();

      quotes.addAll(secondQuery.docs);
    }

    return quotes;
  }

  // for storing the quotation
}
