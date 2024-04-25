import 'package:flutter_project_orm_janggo/data/dto/picture_dto.dart';
import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';

extension ToPicture on Hits {
  PictureModel toPicture() {
    return PictureModel(
      id: id!.toInt(),
      url: previewURL ?? '',
      tags: tags ?? '',
    );
  }
}
