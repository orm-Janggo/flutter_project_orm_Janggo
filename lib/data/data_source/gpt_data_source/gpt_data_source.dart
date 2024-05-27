import 'dart:convert';

import 'package:flutter_project_orm_janggo/core/config/api_config.dart';
import 'package:flutter_project_orm_janggo/data/data_source/gpt_data_source/request_data.dart';

import 'package:http/http.dart' as http;

class GptDataSource {
  final apiKey = ChatGptConfig.apiKey;
  final Uri baseUrl = Uri.parse(ChatGptConfig.baseUrl);

  Future<List<String>> getRecipes(String ingredients) async {
    // requestData의 복사본 생성
    final Map<String, dynamic> requestDataCopy =
        jsonDecode(jsonEncode(requestData));

    // 필요한 부분만 업데이트
    requestDataCopy['messages'][1]['content'] =
        '저에게 3가지 레시피를 추천해 주세요. 저는 $ingredients를 가지고 있습니다.';

    final response = await http.post(
      baseUrl,
      headers: {
        'Authorization': 'Bearer $apiKey', // API 키 인증
        'Content-Type': 'application/json'
      },
      body: jsonEncode(requestDataCopy), // 요청 데이터를 JSON으로 직렬화
    );

    if (response.statusCode == 200) {
      String assistantResponse =
          jsonDecode(utf8.decode(response.bodyBytes))['choices'][0]['message']
              ['content'];

      // '레시피 1:', '레시피 2:', '레시피 3:'과 같은 구분자를 찾아내어 레시피를 분리
      final List<String> recipes = assistantResponse.split('next');
      final List<String> trimmedRecipes =
          recipes.map((recipe) => recipe.trim()).toList();

      if (trimmedRecipes.isEmpty) {
        return ['레시피를 찾을 수 없습니다.'];
      }

      return trimmedRecipes; // 레시피를 리스트로 반환
    } else {
      return ['API 요청이 실패했습니다.'];
    }
  }
}
