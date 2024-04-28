import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/picture_repository.dart';

class GetPictureUseCase {
  final PictureRepository _repository;

  GetPictureUseCase(this._repository);

  Future<PictureModel> execute(String query) async {
    return (await _repository.getPicture(query))[0];
  }
}