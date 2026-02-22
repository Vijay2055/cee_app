import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psc_app/data/services/cee_services/cee_firebase_services.dart';
import 'package:psc_app/model/cee_model/disscution_model.dart';

class DisscutionWithSnapshot {
  final DisscutionModel model;
  final DocumentSnapshot snapshot;

  DisscutionWithSnapshot(this.model, this.snapshot);
}

class CeeDiscussionRepo {
  final CeeFirebaseServices _services;

  CeeDiscussionRepo(this._services);

  Future<List<DisscutionWithSnapshot>> getMessages(
    String roomId, {
    DocumentSnapshot? startAfter,
    int limit = 15,
  }) async {
    final snaphot = await _services.fetchMessages(
      roomId,
      startAfter: startAfter,
      limit: limit,
    );

    return snaphot.docs
        .map(
          (doc) => DisscutionWithSnapshot(
            DisscutionModel.fromMap(doc.id, doc.data() as Map<String, dynamic>),
            doc,
          ),
        )
        .toList();

    // return snaphot.docs
    //     .map(
    //       (doc) =>DisW
    //     )
    //     .toList();
  }

  Stream<List<DisscutionModel>> listenMessage(String roomId) {
    return _services
        .listenMessages(roomId)
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => DisscutionModel.fromMap(
                  roomId,
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Future<void> sentTextMessage(String roomId, String text, String senderId) {
    return _services.sendMessage(roomId, {
      "text": text,
      "senderId": senderId,
      "imageUrl": null,
      "createdAt": DateTime.now(),
    });
  }

  Future<void> sendImageMessage(
    String roomId,
    String imageUrl,
    String senderId,
  ) {
    return _services.sendMessage(roomId, {
      "text": "",
      "senderId": senderId,
      "imageUrl": imageUrl,
      "createdAt": DateTime.now(),
    });
  }

  Future<String> uploadImage(String roomId, String path) {
    return _services.uploadFile(roomId, File(path));
  }
}
