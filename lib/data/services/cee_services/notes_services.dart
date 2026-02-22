import 'package:cloud_firestore/cloud_firestore.dart';

class NotesServices {
  final _fireStore = FirebaseFirestore.instance;

// services for fetching past year queston paper
  Future<List<Map<String,dynamic>>> fetchPastyearQuestionDocs(
    {
      required String collectionId,

    }
  ) async{
    final data= await _fireStore.collection(collectionId).get();

  return data.docs.map((doc)=>{
    "id":doc.id,
    ...doc.data()
  }).toList();
  
  }


// service ofr fetching pdf notes
  Future<List<Map<String, dynamic>>> fetchDocument({
    required String collection,
    Map<String, dynamic>? filters,
  }) async {
    Query query = _fireStore.collection(collection);

    if (filters != null) {
      filters.forEach((key, value) {
        query = query.where(key, isEqualTo: value);
      });
    }

    final snapshot = await query.get();

    return snapshot.docs.map((doc) => {
       "id": doc.id,
          ...doc.data() as Map<String, dynamic>,
    }).toList();
  }
}
