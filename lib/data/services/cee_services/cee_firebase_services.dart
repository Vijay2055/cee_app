import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CeeFirebaseServices {
  final _fireStore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<QuerySnapshot> fetchMessages(
    String roomId, {
    DocumentSnapshot? startAfter,
    int limit = 15,
  }) {
    var query = _fireStore
        .collection("rooms")
        .doc(roomId)
        .collection('messages')
        .orderBy("createdAt", descending: true)
        .limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    return query.get();
  }

  Stream<QuerySnapshot> listenMessages(String roomId) {
    return _fireStore
        .collection("rooms")
        .doc(roomId)
        .collection("messages")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Future<void> sendMessage(String roomId, Map<String, dynamic> message) {
    return _fireStore
        .collection('rooms')
        .doc(roomId)
        .collection("messages")
        .add(message);
  }

  Future<String> uploadFile(String roomId, File file) {
    String extension = path.extension(file.path);

    final ref = _storage.ref().child(
      'rooms/$roomId/${DateTime.now().millisecondsSinceEpoch}$extension',
    );
    ref.putFile(file);

    return ref.getDownloadURL();
  }

  Future<List<String>> loadCategoryOfMcq(String documentId) async {
    final snapshot = await _fireStore
        .collection('mcq')
        .doc(documentId)
        .collection('categories')
        .get();
    return snapshot.docs
        .map((doc) => doc.data()['category'] as String)
        .toList();
  }
}
