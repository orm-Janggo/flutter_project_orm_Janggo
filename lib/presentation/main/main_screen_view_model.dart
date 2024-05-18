import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/auth_state_changes_use_case.dart';

class MainScreenViewModel with ChangeNotifier {
  final AuthStateChangesUseCase _authStateChangesUseCase;

  MainScreenViewModel({
    required AuthStateChangesUseCase authStateChangesUseCase,
  }) : _authStateChangesUseCase = authStateChangesUseCase;

  String? _userEmail;
  String? _userDisplayName;
  UserInfoModel? _firebaseUser;

  String? get userEmail => _userEmail;

  String? get userDisplayName => _userDisplayName;

  UserInfoModel? get firebaseUser => _firebaseUser;

  void getCurrentUserInfo() {
    _firebaseUser = _authStateChangesUseCase.execute();

    _userEmail = firebaseUser?.email;

    _userDisplayName = firebaseUser?.displayName;
  }
}
