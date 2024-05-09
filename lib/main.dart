import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project_orm_janggo/go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'core/config/api_config.dart';
import 'data/db/like_hive/like_item.dart';

late Box<List<LikeItem>> likeBox;

// 엔트리 포인트,시작점
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LikeItemAdapter());
  likeBox = await Hive.openBox<List<LikeItem>>('likebox');
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: KakaoConfig.nativeAppKey,
    javaScriptAppKey: KakaoConfig.javascriptKey,
  );

  runApp(const MyApp());
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'school_font'),
          )),
      routerConfig: router,
    );
  }
}
