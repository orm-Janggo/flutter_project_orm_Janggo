import 'package:flutter_project_orm_janggo/data/repository/picture_repository_impl.dart';
import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/picture_repository.dart';

class GetPictureUseCase {
  final PictureRepositoryImpl _repository;

  const GetPictureUseCase({
    required PictureRepositoryImpl repository,
  }) : _repository = repository;

  Future<PictureModel> execute(String query) async {
    return (await _repository.getPicture(query))[0];
  }

}
