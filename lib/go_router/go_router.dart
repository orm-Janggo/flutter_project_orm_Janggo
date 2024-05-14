import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_orm_janggo/data/gpt_data_source/gpt_data_source.dart';
import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_repository_impl.dart';
import 'package:flutter_project_orm_janggo/data/repository/firebase_auth_repository/firebase_auth_repository_impl.dart';
import 'package:flutter_project_orm_janggo/data/repository/like_recipe_repository_impl.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/auth_state_changes_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/send_password_reset_email_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_in_with_email_password_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_out_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/sign_up_with_email_password_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/update_display_name_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/firebase_auth_use_case/update_password_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_detail/recipe_history_detail_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_detail/recipe_history_detail_view_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_add_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_load_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_remove_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_search_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_screen.dart';
import 'package:flutter_project_orm_janggo/presentation/locker/recipe_history/recipe_history_view_model.dart';
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

import '../data/data_source/picture_data_source.dart';
import '../data/db/like_hive/like_adapter.dart';
import '../data/repository/picture_repository_impl.dart';
import '../domain/use_case/get_picture_use_case.dart';

import '../presentation/locker/recipe_like/like_recipe_screen.dart';
import '../presentation/main/main_screen.dart';
import '../presentation/main/main_screen_view_model.dart';
import '../presentation/recipe_screen/recipe_screen.dart';
import '../presentation/recipe_screen/recipe_view_model.dart';


final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => SplashScreenViewModel(
            authStateChangesUseCase: AuthStateChangesUseCase(
              FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
            ),

            signOutUseCase: SignOutUseCase(
                FirebaseAuthRepositoryImpl(FirebaseAuth.instance)),
          ),
          child: const SplashScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => SignInViewModel(
                signInWithEmailPasswordUseCase: SignInWithEmailPasswordUseCase(
                  FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                ),
                authStateChangesUseCase: AuthStateChangesUseCase(
                    FirebaseAuthRepositoryImpl(FirebaseAuth.instance)),
              ),
              child: const SignInScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => ForgotPasswordViewModel(
                    sendPasswordResetEmailUseCase:
                        SendPasswordResetEmailUseCase(
                      FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                    ),
                  ),
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
            return ChangeNotifierProvider(
              create: (_) => MainScreenViewModel(
                authStateChangesUseCase: AuthStateChangesUseCase(
                  FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                ),
              ),

              child: const MainScreen(),
            );
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
                        dataSource: GptDataSource(),
                      ),
                    ),
                    likeAddRecipeUseCase: LikeAddRecipeUseCase(
                        likeRecipeRepositoryImpl: LikeRecipeRepositoryImpl()),
                    likeRemoveRecipeUseCase: LikeRemoveRecipeUseCase(
                        likeRecipeRepositoryImpl: LikeRecipeRepositoryImpl()),


                  ),
                  child: RecipeScreen(
                    ingredients: state.extra as String,
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: 'recipe-like',
                  builder: (context, state) {
                    return ChangeNotifierProvider(
                      create: (_) => RecipeViewModel(
                        getPictureUseCase: GetPictureUseCase(
                            repository: PictureRepositoryImpl(
                                pictureDataSource: PictureDataSource())),
                        getRecipeUseCase: GetRecipeUseCase(
                            chatGptRepositoryImpl: ChatGptRepositoryImpl(
                                dataSource: GptDataSource())),
                        likeAddRecipeUseCase: LikeAddRecipeUseCase(
                            likeRecipeRepositoryImpl: LikeRecipeRepositoryImpl()),
                        likeRemoveRecipeUseCase: LikeRemoveRecipeUseCase(
                            likeRecipeRepositoryImpl: LikeRecipeRepositoryImpl()),
                      ),
                      child: LikeRecipeScreen(),
                    );

                  },
                ),
              ],
            ),

            GoRoute(
              path: 'recipe-history',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => RecipeHistoryViewModel(),
                  child: RecipeHistoryScreen(),
                );
              },
            ),

            GoRoute(
              path: 'recipe-history-detail',
              builder: (context, state) {
                return ChangeNotifierProvider(
                    create: (_) => RecipeHistoryDetailViewModel(),
                    child: RecipeHistoryDetailScreen(id: state.extra as int,)
                );
              },
            ),
            GoRoute(
              path: 'my-page',
              builder: (context, state) {
                return ChangeNotifierProvider(
                  create: (_) => MyPageViewModel(
                    authStateChangesUseCase: AuthStateChangesUseCase(
                      FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                    ),
                    updateDisplayNameUseCase: UpdateDisplayNameUseCase(
                      FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                    ),
                    updatePasswordUseCase: UpdatePasswordUseCase(
                      FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                    ),
                    signOutUseCase: SignOutUseCase(
                      FirebaseAuthRepositoryImpl(FirebaseAuth.instance),
                    ),
                  ),
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
