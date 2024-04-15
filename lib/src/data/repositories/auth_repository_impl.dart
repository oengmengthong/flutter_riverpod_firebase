import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/types.dart';
import 'package:injectable/injectable.dart';

import '../datasources/local/auth_data_local.dart';
import '../datasources/remote/auth_data_remote.dart';
import 'auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.local,
    required this.remote,
  });

  final AuthDataLocal local;
  final AuthDataRemote remote;

  @override
  Future<String> getDeviceId() {
    // TODO: implement getDeviceId
    throw UnimplementedError();
  }

  @override
  Future<void> requestOTP(String phoneNumber, PhoneVerificationCompleted verificationCompleted, PhoneVerificationFailed verificationFailed, PhoneCodeSent codeSent, PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout) {
    // TODO: implement requestOTP
    throw UnimplementedError();
  }

  @override
  Future<void> setDeviceId(String value) {
    // TODO: implement setDeviceId
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithEmailPassword(String email, String password) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithOTP(String verificationId, String smsCode) {
    // TODO: implement signInWithOTP
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signUpWithEmailPassword(String email, String password) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }

}