import 'package:firebase_auth/firebase_auth.dart';

abstract class  UserRepository {
  User? getCurrentUser();

  Future<void> resetPassword(String email);

  Future<void> updatePassword(String password);

  Future<void> deleteAccount();
}