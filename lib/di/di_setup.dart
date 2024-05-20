import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_orm_janggo/data/repository/auth_repository_impl.dart';
import 'package:get_it/get_it.dart';

import '../data/data_source/gpt_data_source/gpt_data_source.dart';
import '../data/data_source/picture_data_source.dart';
import '../data/repository/like_recipe_repository_impl.dart';
import '../data/repository/picture_repository_impl.dart';
import '../data/repository/recipe_repository_impl.dart';
import '../domain/repository/like_recipe_repository.dart';
import '../domain/repository/picture_repository.dart';
import '../domain/repository/recipe_repository.dart';
import '../domain/repository/auth_repository/auth_repository.dart';
import '../domain/use_case/auth_use_case/auth_state_changes_use_case.dart';
import '../domain/use_case/auth_use_case/send_password_reset_email_use_case.dart';
import '../domain/use_case/auth_use_case/sign_in_with_email_password_use_case.dart';
import '../domain/use_case/auth_use_case/sign_out_use_case.dart';
import '../domain/use_case/auth_use_case/sign_up_with_email_password_use_case.dart';
import '../domain/use_case/auth_use_case/update_display_name_use_case.dart';
import '../domain/use_case/auth_use_case/update_password_use_case.dart';
import '../domain/use_case/get_picture_use_case/get_picture_use_case.dart';
import '../domain/use_case/like_recipe_use_case/like_add_recipe_use_case.dart';
import '../domain/use_case/like_recipe_use_case/like_load_recipe_use_case.dart';
import '../domain/use_case/like_recipe_use_case/like_remove_recipe_use_case.dart';
import '../domain/use_case/like_recipe_use_case/like_search_recipe_use_case.dart';
import '../domain/use_case/recipe_use_case/get_food_name_use_case.dart';
import '../domain/use_case/recipe_use_case/get_recipe_use_case.dart';
import '../presentation/locker/recipe_history/recipe_history/recipe_history_view_model.dart';
import '../presentation/locker/recipe_history/recipe_history_detail/recipe_history_detail_view_model.dart';
import '../presentation/locker/recipe_like/like_recipe_viewmodel.dart';
import '../presentation/main/main_view_model.dart';
import '../presentation/my_page/my_page_view_model.dart';
import '../presentation/recipe_screen/recipe_view_model.dart';
import '../presentation/sign/forgot_password/forgot_password_view_model.dart';
import '../presentation/sign/sign_in/kakao/social_login/kakao_login/kakao_login_service.dart';
import '../presentation/sign/sign_in/sign_in_view_model.dart';
import '../presentation/sign/sign_up/sign_up_view_model.dart';
import '../presentation/splash/splash_screen_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  getIt.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(FirebaseAuth.instance));
  getIt.registerSingleton<RecipeRepository>(
      RecipeRepositoryImpl(dataSource: GptDataSource()));
  getIt.registerSingleton<PictureRepository>(
      PictureRepositoryImpl(pictureDataSource: PictureDataSource()));
  getIt.registerSingleton<LikeRecipeRepository>(LikeRecipeRepositoryImpl());
  getIt.registerSingleton<AuthStateChangesUseCase>(
      AuthStateChangesUseCase(getIt()));
  getIt.registerSingleton<SendPasswordResetEmailUseCase>(
      SendPasswordResetEmailUseCase(getIt()));
  getIt.registerSingleton<SignInWithEmailPasswordUseCase>(
      SignInWithEmailPasswordUseCase(getIt()));
  getIt.registerSingleton<SignOutUseCase>(SignOutUseCase(getIt()));
  getIt.registerSingleton<SignUpWithEmailPasswordUseCase>(
      SignUpWithEmailPasswordUseCase(getIt()));
  getIt.registerSingleton<UpdateDisplayNameUseCase>(
      UpdateDisplayNameUseCase(getIt()));
  getIt
      .registerSingleton<UpdatePasswordUseCase>(UpdatePasswordUseCase(getIt()));
  getIt.registerSingleton<GetPictureUseCase>(
      GetPictureUseCase(repository: getIt()));
  getIt.registerSingleton<LikeAddRecipeUseCase>(
      LikeAddRecipeUseCase(likeRecipeRepositoryImpl: getIt()));
  getIt.registerSingleton<LikeLoadRecipeUseCase>(
      LikeLoadRecipeUseCase(likeRecipeRepositoryImpl: getIt()));
  getIt.registerSingleton<LikeRemoveRecipeUseCase>(
      LikeRemoveRecipeUseCase(likeRecipeRepositoryImpl: getIt()));
  getIt.registerSingleton<LikeSearchRecipeUseCase>(
      LikeSearchRecipeUseCase(likeRecipeRepositoryImpl: getIt()));
  getIt.registerSingleton<GetFoodNameUseCase>(GetFoodNameUseCase());
  getIt.registerSingleton<GetRecipeUseCase>(
      GetRecipeUseCase(chatGptRepositoryImpl: getIt()));

  getIt.registerLazySingleton<KakaoLoginService>(() => KakaoLoginService());

  getIt.registerFactory(() => MainViewModel(authStateChangesUseCase: getIt()));
  getIt.registerFactory(() => MyPageViewModel(
      updateDisplayNameUseCase: getIt(),
      authStateChangesUseCase: getIt(),
      updatePasswordUseCase: getIt(),
      signOutUseCase: getIt()));
  getIt.registerFactory(() => RecipeViewModel(
      getPictureUseCase: getIt(),
      getRecipeUseCase: getIt(),
      likeAddRecipeUseCase: getIt(),
      likeRemoveRecipeUseCase: getIt(),
      getFoodNameUseCase: getIt()));
  getIt.registerFactory(
      () => ForgotPasswordViewModel(sendPasswordResetEmailUseCase: getIt()));
  getIt.registerFactory(() => SignInViewModel(
      authStateChangesUseCase: getIt(),
      signInWithEmailPasswordUseCase: getIt(),
      kakaoLoginService: getIt()));
  getIt.registerFactory(
      () => SignUpViewModel(signUpWithEmailPasswordUseCase: getIt()));
  getIt.registerFactory(() => SplashScreenViewModel(
      signOutUseCase: getIt(), authStateChangesUseCase: getIt()));
  getIt.registerFactory(
      () => LikeRecipeViewModel(likeRemoveRecipeUseCase: getIt()));
  getIt.registerFactory(() => RecipeHistoryDetailViewModel());
  getIt.registerFactory(() => RecipeHistoryViewModel());
}
