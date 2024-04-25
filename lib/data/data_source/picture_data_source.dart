import 'dart:convert';

import 'package:http/http.dart' as http;

import '../dto/picture_dto.dart';

class PictureDataSource {
  final _baseUrl = 'https://pixabay.com/api/?key=';
  final _key = '43565705-c9895710d0a4c1f822464b641';

  Future<PictureDto> getPictureData(String query) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/?key=$_key&q=$query&image_type=photo&pretty=true'));

    return PictureDto.fromJson(jsonDecode(response.body));
  }
}
