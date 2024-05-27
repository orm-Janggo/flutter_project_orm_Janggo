import 'package:flutter/material.dart';

class KakaoLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Image.asset('assets/images/kakao_login_large_wide.png'),
      ),
    );
  }

  const KakaoLoginButton({
    super.key,
    required this.onTap,
  });
}
