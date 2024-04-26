import 'dart:convert';

import 'package:flutter_project_orm_janggo/core/config/api_config.dart';
import 'package:http/http.dart' as http;

import '../dto/picture_dto.dart';

class PictureDataSource {
  final _baseUrl = PixabayConfig.baseUrl;
  final _key = PixabayConfig.apiKey;

  Future<PictureDto> getPictureData(String query) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/?key=$_key&q=$query&image_type=photo&pretty=true'));

    return PictureDto.fromJson(jsonDecode(response.body));
  }
}
