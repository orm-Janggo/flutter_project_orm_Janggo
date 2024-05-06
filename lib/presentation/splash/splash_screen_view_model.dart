import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/auth_state_changes_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_out_use_case.dart';

class SplashScreenViewModel with ChangeNotifier {
  final AuthStateChangesUseCase _authStateChangesUseCase;
  final SignOutUseCase _signOutUseCase;

  SplashScreenViewModel({
    required AuthStateChangesUseCase authStateChangesUseCase,
    required SignOutUseCase signOutUseCase,
  })  : _authStateChangesUseCase = authStateChangesUseCase,
        _signOutUseCase = signOutUseCase;

  String? _userEmail;
  String? _userDisplayName;
  UserInfoModel? _firebaseUser;

  String? get userEmail => _userEmail;

  String? get userDisplayName => _userDisplayName;

  UserInfoModel? get firebaseUser => _firebaseUser;

  void getCurrentUserInfo() {
    _firebaseUser = _authStateChangesUseCase.execute();
    notifyListeners();

    _userEmail = firebaseUser?.email;
    notifyListeners();

    _userDisplayName = firebaseUser?.displayName;
    notifyListeners();
  }

  void signOutCurrentUser() async {
    await _signOutUseCase.execute();

    notifyListeners();
  }
}
