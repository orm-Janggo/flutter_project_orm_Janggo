import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project_orm_janggo/data/db/history/history_recipe_data.dart';
import 'package:flutter_project_orm_janggo/router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'core/config/api_config.dart';
import 'data/db/like_hive/like_item.dart';

late Box<LikeItem> likeBox;

Future<void> initializeLikeBox() async {
  likeBox = await Hive.openBox<LikeItem>('likebox'); // 초기화
}

// 엔트리 포인트,시작점
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<LikeItem>(LikeItemAdapter());
  await initializeLikeBox(); // LikeBox 초기화 완료
  Hive.openBox<HistoryRecipeData>('historyRecipeBox');
  Hive.registerAdapter(HistoryRecipeDataAdapter());

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

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
