import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case.dart';

class RecipeViewModel {
  final GetPictureUseCase _getPictureUseCase;

  PictureModel? _picture;

  PictureModel? get picture => _picture;

  RecipeViewModel({required GetPictureUseCase getPictureUseCase})
      : _getPictureUseCase = getPictureUseCase;

Future<PictureModel> getPicture(String query) async {
    final pic = await _getPictureUseCase.execute(query);
    return pic;
  }
}
