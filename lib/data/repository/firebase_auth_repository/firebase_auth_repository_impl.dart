import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_orm_janggo/domain/repository/firebase_auth_repository/firebase_auth_repository.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  @override
  Future<UserCredential> callSignInWithEmailAndPassword(
      String inputEmail, String inputPassword) {
    // TODO: implement callSignInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> callCreateUserWithEmailAndPassword(
      String inputEmail, String inputPassword) {
    // TODO: implement callCreateUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Stream<User?> callAuthStateChanges() {
    // TODO: implement callAuthStateChanges
    throw UnimplementedError();
  }
}
