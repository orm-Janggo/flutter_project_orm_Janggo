import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../core/config/api_config.dart';
import 'package:flutter_project_orm_janggo/data/gpt_data_source/gpt_data_source.dart';
import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_reopository_impl.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/login_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/main_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/picture_data_source.dart';
import '../../data/repository/picture_repository_impl.dart';
import '../../domain/use_case/get_picture_use_case.dart';
import '../../presentation/recipe_screen.dart';
import '../../presentation/recipe_view_model.dart';

void main() async {
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
      ),
      routerConfig: tempRouter,
    );
  }
}

final tempRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen();
            // return SignInScreen(
            //   actions: [
            //     ForgotPasswordAction(((context, email) {
            //       final uri = Uri(
            //         path: '/sign-in/forgot-password',
            //         queryParameters: <String, String?>{
            //           'email': email,
            //         },
            //       );
            //       context.push(uri.toString());
            //     })),
            //     AuthStateChangeAction(((context, state) {
            //       final user = switch (state) {
            //         SignedIn state => state.user,
            //         UserCreated state => state.credential.user,
            //         _ => null
            //       };
            //       if (user == null) {
            //         return;
            //       }
            //       if (state is UserCreated) {
            //         user.updateDisplayName(user.email!.split('@')[0]);
            //       }
            //       if (!user.emailVerified) {
            //         user.sendEmailVerification();
            //         const snackBar = SnackBar(
            //             content: Text(
            //                 'Please check your email to verify your email address'));
            //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //       }
            //       context.pushReplacement('/');
            //     })),
            //   ],
            // );
          },
        ),
        GoRoute(
            path: 'main',
            builder: (context, state) {
              return MainScreen();
            },
            routes: [
              GoRoute(
                path: 'recipe',
                builder: (context, state) {
                  return ChangeNotifierProvider(
                    create: (_) => RecipeViewModel(
                      getPictureUseCase: GetPictureUseCase(
                        repository: PictureRepositoryImpl(
                          pictureDataSource: PictureDataSource(),
                        ),
                      ),
                      getRecipeUseCase: GetRecipeUseCase(
                          chatGptRepositoryImpl: ChatGptRepositoryImpl(
                              dataSource: GptDataSource())),
                    ),
                    child: RecipeScreen(
                      ingredients: state.extra as String,
                    ),
                  );
                },
              ),
            ]),
      ],
    ),
  ],
);