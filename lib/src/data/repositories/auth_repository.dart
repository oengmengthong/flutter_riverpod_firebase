import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<String> getDeviceId();

  Future<void> setDeviceId(String value);

  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  );

  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password,
  );

  Future<UserCredential> signInWithGoogle();

  Future<UserCredential> signInAnonymously();

  Future<void> requestOTP(
    String phoneNumber,
    PhoneVerificationCompleted verificationCompleted,
    PhoneVerificationFailed verificationFailed,
    PhoneCodeSent codeSent,
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  );

  Future<UserCredential> signInWithOTP(String verificationId, String smsCode);

  Future<void> signOut();
}
