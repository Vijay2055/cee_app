import 'package:cloud_firestore/cloud_firestore.dart';

class DisscutionModel {
  final String id;
  final String text;
  final String senderId;
  final String? imageUrl;
  final DateTime createdAt;
  

  DisscutionModel({
    required this.id,
    required this.text,
    required this.senderId,
    this.imageUrl,
    required this.createdAt,
  });

  factory DisscutionModel.fromMap(String id, Map<String, dynamic> data) {
    return DisscutionModel(
      id: id,
      text: data['text'] ?? '',
      senderId: data['senderId'] ?? '',
      imageUrl: data['imageUrl'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderId': senderId,
      "imageUrl": imageUrl,
      'createdAt': createdAt,
    };
  }
}
