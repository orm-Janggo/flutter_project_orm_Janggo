import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/auth_state_changes_use_case.dart';

class MainViewModel with ChangeNotifier {
  final AuthStateChangesUseCase _authStateChangesUseCase;

  MainViewModel({
    required AuthStateChangesUseCase authStateChangesUseCase,
  }) : _authStateChangesUseCase = authStateChangesUseCase;

  UserInfoModel? _firebaseUser;

  UserInfoModel? get firebaseUser => _firebaseUser;

  void fetchCurrentUserInfo() {
    _firebaseUser = _authStateChangesUseCase.execute();
  }
}
