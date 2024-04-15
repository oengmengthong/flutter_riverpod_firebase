import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDataRemote {
  UserDataRemote({
    @Named('firebaseAuth') required this.auth,
  });
  final FirebaseAuth auth;

  // Function to get current user
  User? getCurrentUser() => auth.currentUser;

  // Function to reset password
  Future<void> resetPassword(String email) async =>
      auth.sendPasswordResetEmail(email: email);

  // Function to update password
  Future<void> updatePassword(String password) async =>
      auth.currentUser!.updatePassword(password);

  // Function to delete own account
  Future<void> deleteAccount() async => auth.currentUser!.delete();
}
