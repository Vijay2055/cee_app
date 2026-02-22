import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psc_app/model/user_model.dart';

class UserServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> storeUser(UserModel user) async {
    await _firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }

  Future<void> updateArea(String uuid, String area) async {
    await _firebaseFirestore.collection('users').doc(uuid).update({
      'area': area,
    },
    );
  }

  Future<String?> getUserName() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      return null;
    }

    final doc = await _firebaseFirestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data()?['name'] != null) {
      return doc.data()?['name'];
    }

    return null;
  }

  Future<String?> getUserRole() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) {
      return null;
    }

    final doc = await _firebaseFirestore.collection('users').doc(uid).get();
    if (doc.exists && doc.data()?['area'] != null) {
      return doc.data()?['area'];
    }
    return null;
  }
}
