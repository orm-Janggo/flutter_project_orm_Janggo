import 'package:flutter_project_orm_janggo/data/mapper/picture_mapper.dart';
import 'package:flutter_project_orm_janggo/domain/model/picture_model.dart';
import 'package:flutter_project_orm_janggo/domain/repository/picture_repository.dart';

import '../data_source/picture_data_source.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureDataSource _pictureDataSource;

  const PictureRepositoryImpl({
    required PictureDataSource pictureDataSource,
  }) : _pictureDataSource = pictureDataSource;

  @override
  Future<List<PictureModel>> getPicture(String query) async {
    final pictureDto = await _pictureDataSource.getPictureData(query);
    return pictureDto.hits!.map((e) => e.toPicture()).toList();
  }
}
