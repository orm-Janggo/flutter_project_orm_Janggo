import 'package:flutter_project_orm_janggo/data/gpt_data_source/gpt_data_source.dart';
import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_reopository_impl.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/main_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/forgot_password/forgot_password.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_in/sign_in_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/sign/sign_up/sign_up_screen.dart';
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
            return SignInScreen();
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
            return SignUpScreen();
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
