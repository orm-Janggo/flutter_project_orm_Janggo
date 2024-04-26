import 'package:firebase_auth/firebase_auth.dart';

class SignUpModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signup(String email, String password) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}
