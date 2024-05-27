import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_item.dart';
import 'package:flutter_project_orm_janggo/data/repository/auth_repository_impl.dart';
import 'package:flutter_project_orm_janggo/di/di_setup.dart';

import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history/recipe_history_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_detail/recipe_history_detail_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_detail/recipe_history_detail_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history/recipe_history_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_like/like_recipe_detail_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_like/like_recipe_viewmodel.dart';
import 'package:flutter_project_orm_janggo/presentation/my_page/app_information/app_information_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/my_page/app_information/privacy_policy_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/my_page/app_information/question_answer_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/my_page/my_page_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/my_page/my_page_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/forgot_password/forgot_password_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/forgot_password/forgot_password_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_up/sign_up_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_up/sign_up_view_model.dart';
import 'package:flutter_project_orm_janggo/presentation/splash/splash_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/splash/splash_screen_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../presentation/locker/recipe_like/like_recipe_screen.dart';
import '../presentation/main/main_screen.dart';
import '../presentation/main/main_view_model.dart';
import '../presentation/recipe_screen/recipe_screen.dart';
import '../presentation/recipe_screen/recipe_view_model.dart';

final authRepository = AuthRepositoryImpl(FirebaseAuth.instance);

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => getIt<SplashScreenViewModel>(),
          child: const SplashScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => getIt<SignInViewModel>(),
              child: const SignInScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => getIt<ForgotPasswordViewModel>(),
                  child: const ForgotPasswordScreen(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'sign-up',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => getIt<SignUpViewModel>(),
              child: const SignUpScreen(),
            );
          },
        ),
        GoRoute(
          path: 'main',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => getIt<MainViewModel>(),
              child: const MainScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'recipe',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => getIt<RecipeViewModel>(),
                  child: RecipeScreen(
                    ingredients: state.extra as String,
                  ),
                );
              },
            ),
            GoRoute(
                path: 'recipe-like',
                builder: (context, state) {
                  return ChangeNotifierProvider(
                    create: (_) => getIt<LikeRecipeViewModel>(),
                    child: const LikeRecipeScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'recipe-like-detail',
                    builder: (context, state) {
                      return LikeRecipeDetailScreen(
                        recipe: state.extra as LikeItem,
                      );
                    },
                  ),
                ]),
            GoRoute(
              path: 'recipe-history',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => getIt<RecipeHistoryViewModel>(),
                  child: const RecipeHistoryScreen(),
                );
              },
            ),
            GoRoute(
              path: 'recipe-history-detail',
              builder: (context, state) {
                return ChangeNotifierProvider(
                    create: (_) => getIt<RecipeHistoryDetailViewModel>(),
                    child: RecipeHistoryDetailScreen(
                      id: state.extra as int,
                    ));
              },
            ),
            GoRoute(
              path: 'my-page',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => getIt<MyPageViewModel>(),
                  child: const MyPageScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'app-information',
                  builder: (context, state) {
                    return const AppInformationScreen();
                  },
                  routes: [
                    GoRoute(
                        path: 'license',
                        builder: (context, state) {
                          return const LicensePage();
                        }),
                    GoRoute(
                        path: 'privacy',
                        builder: (context, state) {
                          return const PrivacyPolicyScreen();
                        }),
                    GoRoute(
                        path: 'qna',
                        builder: (context, state) {
                          return const QuestionAnswerScreen();
                        }),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
