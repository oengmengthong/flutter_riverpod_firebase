import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class RoomDataRemote {
  RoomDataRemote({
    @Named('firebaseFirestore') required this.firestore,
  });

  final FirebaseFirestore firestore;

  // Function to list document from Firestore return as json
  Future<List<Object?>> listDocument(
    String collection, {
    String? searchField,
    String? searchValue,
  }) async {
    Query query = firestore.collection(collection);

    if (searchField != null && searchValue != null) {
      query = query.where(searchField, isEqualTo: searchValue);
    }

    final querySnapshot = await query.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  // Function to get a document from Firestore
  Future<Object?> getDocument(String collection, String documentId) async {
    final DocumentSnapshot documentSnapshot =
        await firestore.collection(collection).doc(documentId).get();
    return documentSnapshot.data();
  }

  // Function to get pagination document from Firestore
  Future<List<Object?>> getPaginationDocument(
      String collection, int limit, DocumentSnapshot? lastDocument) async {
    Query query = firestore.collection(collection).limit(limit);
    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    final querySnapshot = await query.get();
    if (querySnapshot.docs.isNotEmpty) {
      lastDocument = querySnapshot.docs.last;
    }

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  // Function to add a document to Firestore
  Future<void> addDocument(String collection, Map<String, dynamic> data) async {
    await firestore.collection(collection).add(data);
  }

  // Function to update a document in Firestore
  Future<void> updateDocument(
      String collection, String documentId, Map<String, dynamic> data) async {
    await firestore.collection(collection).doc(documentId).update(data);
  }

  // Function to delete a document from Firestore
  Future<void> deleteDocument(String collection, String documentId) async {
    await firestore.collection(collection).doc(documentId).delete();
  }
}
