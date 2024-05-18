import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/model/user_info_model/user_info_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/auth_state_changes_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/sign_out_use_case.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

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
  kakao.User? _kakaoUser;

  kakao.User? get kakaoUser => _kakaoUser;

  String? get userEmail => _userEmail;

  String? get userDisplayName => _userDisplayName;

  UserInfoModel? get firebaseUser => _firebaseUser;

  void getCurrentUserInfo() {
    _firebaseUser = _authStateChangesUseCase.execute();
    // notifyListeners();

    _userEmail = firebaseUser?.email;
    // notifyListeners();

    _userDisplayName = firebaseUser?.displayName;
    // notifyListeners();
    _updateKaKaoUserInfo();
    // notifyListeners();
  }

  void _updateKaKaoUserInfo() async {
    try {
      kakao.User kakaoUser = await kakao.UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${kakaoUser.id}'
          '\n닉네임: ${kakaoUser.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${kakaoUser.kakaoAccount?.email}');
      if (_firebaseUser?.email == null &&
          _kakaoUser?.kakaoAccount?.email != null) {
        _userEmail = _kakaoUser?.kakaoAccount?.email;
      }
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  void signOutCurrentUser() async {
    await _signOutUseCase.execute();

    // notifyListeners();
  }
}
