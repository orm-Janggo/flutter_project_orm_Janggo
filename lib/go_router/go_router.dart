import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_orm_janggo/data/gpt_data_source/gpt_data_source.dart';
import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_reopository_impl.dart';
import 'package:flutter_project_orm_janggo/data/repository/firebase_auth_repository/firebase_auth_repository_impl.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_in_with_email_password_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_up_with_email_password_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/main_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/mypage_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/forgot_password/forgot_password_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_up/sign_up_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_up/sign_up_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/data_source/picture_data_source.dart';
import '../data/repository/picture_repository_impl.dart';
import '../domain/use_case/get_picture_use_case.dart';
import '../presentation/recipe_screen.dart';
import '../presentation/recipe_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => SignInViewModel(
                signInWithEmailPasswordUseCase: SignInWithEmailPasswordUseCase(
                  FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                ),
              ),
              child: const SignInScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                return ForgotPasswordScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'sign-up',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => SignUpViewModel(
                signUpWithEmailPasswordUseCase: SignUpWithEmailPasswordUseCase(
                  FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                ),
              ),
              child: const SignUpScreen(),
            );
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
              GoRoute(
                path: 'my-page',
                builder: (context, state) {
                  return MypageScreen();
                },
              ),
            ]),
      ],
    ),
  ],
);
