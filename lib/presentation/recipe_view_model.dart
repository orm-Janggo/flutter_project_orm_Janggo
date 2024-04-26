import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case.dart';

class RecipeViewModel with changeNotifier {
  final GetPictureUseCase _getPictureUseCase;

  RecipeViewModel({required GetPictureUseCase getPictureUseCase}) : _getPictureUseCase = getPictureUseCase;

  void getPhoto(String query) async {

  }
