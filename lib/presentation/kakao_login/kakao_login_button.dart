import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/presentation/kakao_login/kakao_login_view_model.dart';
import 'package:provider/provider.dart';

class KakaoLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const KakaoLoginButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kakaoLoginViewModel = context.watch<KakaoLoginViewModel>();

    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          kakaoLoginViewModel.login(); // 뷰모델을 사용하여 로그인을 처리
          onTap(); // 기존의 onTap 함수 호출
        },
        child: Image.asset('assets/images/kakao_login_large_wide.png'),
      ),
    );
  }
}
