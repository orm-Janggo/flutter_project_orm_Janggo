import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/auth_state_changes_use_case.dart';

import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/sign_out_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/update_display_name_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/update_password_use_case.dart';

class MyPageViewModel with ChangeNotifier {
  final AuthStateChangesUseCase _authStateChangesUseCase;
  final UpdateDisplayNameUseCase _updateDisplayNameUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  MyPageViewModel({
    required AuthStateChangesUseCase authStateChangesUseCase,
    required UpdateDisplayNameUseCase updateDisplayNameUseCase,
    required UpdatePasswordUseCase updatePasswordUseCase,
    required SignOutUseCase signOutUseCase,
  })  : _authStateChangesUseCase = authStateChangesUseCase,
        _updateDisplayNameUseCase = updateDisplayNameUseCase,
        _updatePasswordUseCase = updatePasswordUseCase,
        _signOutUseCase = signOutUseCase;

  String? _userDisplayName;
  String? _userPassword;
  UserInfoModel? _firebaseUser;
  bool _isChange = false;

  String? get userDisplayName => _userDisplayName;

  String? get userPassword => _userPassword;

  UserInfoModel? get firebaseUser => _firebaseUser;

  bool get isChange => _isChange;

  void fetchCurrentUserInfo() {
    _firebaseUser = _authStateChangesUseCase.execute();
  }

  void updateCurrentUserDisplayName(String? inputDisplayName) async {
    if (inputDisplayName != '' && inputDisplayName != null) {
      changeUserDisplayName(inputDisplayName);
      await _updateDisplayNameUseCase.execute(inputDisplayName);
    }
    notifyListeners();
  }

  void updateCurrentUserPassword(String? inputPassword) async {
    if (inputPassword != '' && inputPassword != null) {
      changeUserPassword(inputPassword);
      await _updatePasswordUseCase.execute(inputPassword);
    }

    notifyListeners();
  }

  void signOutCurrentUser() async {
    await _signOutUseCase.execute();

    notifyListeners();
  }

  void changeUserDisplayName(String value) {
    _userDisplayName = value;

    notifyListeners();
  }

  void changeUserPassword(String value) {
    _userPassword = value;

    notifyListeners();
  }

  void changeCanModify() {
    _isChange = !_isChange;

    notifyListeners();
  }
}
