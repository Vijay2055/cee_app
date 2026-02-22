import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String name,
    required String mobile,
    required String email,
  }) async {
    return await _firestore.collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'mobile': mobile,
      'email': email,
      'createAt': FieldValue.serverTimestamp(),
    });
  }

  Future<Map<String, dynamic>?> getUser(String uuid) async {
    final snapShot = await _firestore.collection("users").doc(uuid).get();
   
    if (snapShot.exists && snapShot.data() != null) {
      return snapShot.data()!;
    }
    return null;
  }
}
