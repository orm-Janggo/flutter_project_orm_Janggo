import 'package:firebase_auth/firebase_auth.dart';

abstract interface class FirebaseAuthRepository {
  Future<UserCredential> callSignInWithEmailAndPassword(
      String inputEmail, String inputPassword);

  Future<UserCredential> callCreateUserWithEmailAndPassword(
      String inputEmail, String inputPassword);

  Stream<User?> callAuthStateChanges();
}
