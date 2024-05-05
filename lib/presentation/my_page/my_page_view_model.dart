import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/auth_state_changes_use_case.dart';

class MyPageViewModel with ChangeNotifier {
  final AuthStateChangesUseCase _authStateChangesUseCase;

  MyPageViewModel({required AuthStateChangesUseCase authStateChangesUseCase})
      : _authStateChangesUseCase = authStateChangesUseCase;

  String? userEmail;
  String? userDisplayName;
  UserInfoModel? firebaseUser;

  void getCurrentUserInfo() {
    firebaseUser = _authStateChangesUseCase.execute();
    notifyListeners();

    userEmail = firebaseUser?.email;
    notifyListeners();

    userDisplayName = firebaseUser?.displayName;
    notifyListeners();
  }
}
