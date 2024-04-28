import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project_orm_janggo/go_router/go_router.dart';
import 'package:flutter_project_orm_janggo/presentation/login_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/main_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_state.dart';
import 'package:flutter_project_orm_janggo/presentation/signup_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';

import 'core/config/api_config.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: KakaoConfig.nativeAppKey,
    javaScriptAppKey: KakaoConfig.javascriptKey,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => SignState(),
    builder: ((context, child) => const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}