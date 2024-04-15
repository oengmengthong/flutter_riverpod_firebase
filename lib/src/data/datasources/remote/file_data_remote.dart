import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class FileDataRemote {
  FileDataRemote({
    @Named('firebaseStorage') required this.storage,
  });

  final FirebaseStorage storage;

  // Function to upload a file to Firebase Storage
  Future<String> uploadFile(String path, String fileName) async {
    Reference ref = storage.ref().child(path).child(fileName);
    UploadTask uploadTask = ref.putFile(File(fileName));

    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  // Function to download a file from Firebase Storage
  Future<File> downloadFile(String url) async {
    File file = File(url);
    await file.create();
    await storage.ref().child(url).writeToFile(file);
    return file;
  }

  // Function to delete a file from Firebase Storage
  Future<void> deleteFile(String url) async {
    await storage.ref().child(url).delete();
  }
}
