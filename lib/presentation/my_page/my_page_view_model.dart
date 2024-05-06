import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/auth_state_changes_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/update_display_name_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/update_password_use_case.dart';

class MyPageViewModel with ChangeNotifier {
  final AuthStateChangesUseCase _authStateChangesUseCase;
  final UpdateDisplayNameUseCase _updateDisplayNameUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;

  MyPageViewModel({
    required AuthStateChangesUseCase authStateChangesUseCase,
    required UpdateDisplayNameUseCase updateDisplayNameUseCase,
    required UpdatePasswordUseCase updatePasswordUseCase,
  })  : _authStateChangesUseCase = authStateChangesUseCase,
        _updateDisplayNameUseCase = updateDisplayNameUseCase,
        _updatePasswordUseCase = updatePasswordUseCase;

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

  void updateCurrentUserDisplayName(String inputDisplayName) async {
    _userDisplayName = inputDisplayName;
    await _updateDisplayNameUseCase.execute(inputDisplayName);

    notifyListeners();
  }

  void updateCurrentUserPassword(String inputPassword) async {
    await _updatePasswordUseCase.execute(inputPassword);

    notifyListeners();
  }
}
