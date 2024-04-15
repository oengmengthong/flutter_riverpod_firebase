import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthDataRemote {
  AuthDataRemote({
    @Named('firebaseAuth') required this.auth,
  });
  final FirebaseAuth auth;

// Function to sign in with email and password
  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Function to sign up with email and password
  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password,
  ) async =>
      auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  // Function to sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    final googleProvider = GoogleAuthProvider();
    return auth.signInWithPopup(googleProvider);
  }

  // Function to sign in with Anonymous
  Future<UserCredential> signInAnonymously() async => auth.signInAnonymously();

  // Function to request OTP
  Future<void> requestOTP(
    String phoneNumber,
    PhoneVerificationCompleted verificationCompleted,
    PhoneVerificationFailed verificationFailed,
    PhoneCodeSent codeSent,
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  ) async =>
      auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );

  // Function to sign in with otp
  Future<UserCredential> signInWithOTP(
      String verificationId, String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return auth.signInWithCredential(credential);
  }

  // Function to sign out
  Future<void> signOut() async => auth.signOut();
}
