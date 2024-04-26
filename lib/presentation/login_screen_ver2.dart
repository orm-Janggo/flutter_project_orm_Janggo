import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'kakao_login/kakao_login_ver2.dart';

Widget getKakaoLoginButton() {
  return InkWell(
    onTap: () {
      signInWithKakao();
    },
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      elevation: 2,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/kakao_login_button.png', height: 30,),
          SizedBox(
            width: 10,
          )
          ],
        ),
      ),
    ),
  );
}
