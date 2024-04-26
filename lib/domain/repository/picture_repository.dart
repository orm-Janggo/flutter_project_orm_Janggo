import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';

abstract interface class PictureRepository {
  Future<PictureModel> getPicture(String query);
}
