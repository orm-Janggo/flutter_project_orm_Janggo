import 'package:flutter_project_orm_janggo/domain/model/picture_model/picture_model.dart';

import '../../repository/picture_repository.dart';

class GetPictureUseCase {
  final PictureRepository _repository;

  const GetPictureUseCase({
    required PictureRepository repository,
  }) : _repository = repository;

  Future<PictureModel?> execute(String query) async {
    final pictures = await _repository.getPicture(query);

    if (pictures.isEmpty) {
      return null; // 빈 리스트를 받을 경우 null 반환
    }

    return pictures[0]; // 첫 번째 항목 반환
  }

}
