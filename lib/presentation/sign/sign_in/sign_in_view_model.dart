import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/auth_state_changes_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/auth_use_case/sign_in_with_email_password_use_case.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../data/user_information/user_information.dart';
import '../../../domain/model/user_info_model/user_info_model.dart';
import 'kakao/social_login/kakao_login/kakao_login_service.dart';

class SignInViewModel with ChangeNotifier {
  final SignInWithEmailPasswordUseCase _signInWithEmailPasswordUseCase;
  final AuthStateChangesUseCase _authStateChangesUseCase;
  final KakaoLoginService _kakaoLoginService;

  SignInViewModel({
    required SignInWithEmailPasswordUseCase signInWithEmailPasswordUseCase,
    required AuthStateChangesUseCase authStateChangesUseCase,
    required KakaoLoginService kakaoLoginService,
  })  : _signInWithEmailPasswordUseCase = signInWithEmailPasswordUseCase,
        _authStateChangesUseCase = authStateChangesUseCase,
        _kakaoLoginService = kakaoLoginService;

  String? _inputEmail;
  String? _inputPassword;
  bool _isChecked = true;
  bool _isObscure = true;

  String? get inputEmail => _inputEmail;

  String? get inputPassword => _inputPassword;

  bool get isChecked => _isChecked;

  bool get isObscure => _isObscure;

  UserInfoModel? _firebaseUser;

  UserInfoModel? get firebaseUser => _firebaseUser;

  bool get isKakaoLogined => _kakaoLoginService.isLogined;

  User? get kakaoUser => _kakaoLoginService.user;

  void changeInputEmail(String value) {
    _inputEmail = value;
    notifyListeners();
  }

  void changeInputPassword(String value) {
    _inputPassword = value;
    notifyListeners();
  }

  void changeIsObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  void changeIsChecked() {
    _isChecked = !_isChecked;
    notifyListeners();
  }

  Future<void> signInWithFirebaseAuth(
      String inputEmail, String inputPassword) async {
    await _signInWithEmailPasswordUseCase.execute(inputEmail, inputPassword);
    getUserInformation();
    notifyListeners();
  }

  void getUserInformation() async {
    _firebaseUser = _authStateChangesUseCase.execute();
    if (_firebaseUser != null) {
      UserInformation().updateLoginMethod(LoginMethod.email);
      UserInformation().updateUser(
          email: firebaseUser!.email, displayName: firebaseUser!.displayName);
    }
    notifyListeners();
  }

  Future<void> signInWithKakao() async {
    bool isKakaoLoginSuccess = false;
    try {
      // 카카오 로그인 시도
      isKakaoLoginSuccess = await _kakaoLoginService.login();
      if (isKakaoLoginSuccess) {
        // 카카오 로그인 성공
        User loggedInUser = _kakaoLoginService.user!;
        UserInformation().updateLoginMethod(LoginMethod.kakao);
        UserInformation().updateUser(
            email: loggedInUser.kakaoAccount?.email ?? '',
            displayName: loggedInUser.kakaoAccount?.profile?.nickname ?? '');
      }
    } catch (error) {
      // 카카오 로그인 실패 시, 카카오 계정으로 로그인 시도
      print('카카오 로그인 실패: $error');
      try {
        // 카카오 계정 로그인 시도
        bool isKakaoAccountLoginSuccess =
            await _kakaoLoginService.loginWithKakaoAccount();
        if (isKakaoAccountLoginSuccess) {
          // 카카오 계정 로그인 성공
          User loggedInUser = _kakaoLoginService.user!;
          UserInformation().updateLoginMethod(LoginMethod.kakao);
          // 사용자 정보 업데이트
          UserInformation().updateUser(
              email: loggedInUser.kakaoAccount?.email ?? '',
              displayName: loggedInUser.kakaoAccount?.profile?.nickname ?? '');
        }
      } catch (error) {
        // 카카오 계정 로그인 실패
        print('카카오 계정 로그인 실패: $error');
      }
    }
    notifyListeners();
  }

  Future<void> signOutFromKakao() async {
    await _kakaoLoginService.logout();
    notifyListeners();
  }
}
