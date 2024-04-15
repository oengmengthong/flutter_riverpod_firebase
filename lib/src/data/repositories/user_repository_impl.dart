import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod_firebase/src/data/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

import '../datasources/local/user_data_local.dart';
import '../datasources/remote/user_data_remote.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.local,
    required this.remote,
  });

  final UserDataLocal local;
  final UserDataRemote remote;

  @override
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  User? getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(String password) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

}