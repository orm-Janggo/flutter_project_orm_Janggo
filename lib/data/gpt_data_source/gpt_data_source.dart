import 'dart:convert';

import 'package:flutter_project_orm_janggo/core/config/api_config.dart';
import 'package:http/http.dart' as http;

class GptDataSource {
  final apiKey = ChatGptConfig.apiKey;
  final Uri baseUrl = Uri.parse(ChatGptConfig.baseUrl);

  Map<String, dynamic> requestData = {
    'model': 'gpt-3.5-turbo',
    'messages': [
      {
        'role': 'system',
        'content': '당신은 요리 레시피를 추천하는 유용한 도우미입니다.'
      },
      {
        'role': 'user',
        'content': '재료 설명'
      },
      {
        'role': 'user',
        'content': '각 레시피에 상세한 재료와 조리 과정을 포함시켜 주세요.'
      }
    ],
    'temperature': 0.8,
    'max_tokens': 800,  // 더 많은 레시피를 받기 위해 최대 토큰 수 증가
  };

  Future<String> getRecipes(String ingredients) async {
    requestData['messages'][1]['content'] =
    '저에게 3가지 레시피를 추천해 주세요. 저는 $ingredients를 가지고 있습니다.';
    final response = await http.post(
      baseUrl,
      headers: {
        'Authorization': 'Bearer $apiKey',  // API 키 인증
        'Content-Type': 'application/json'
      },
      body: jsonEncode(requestData),  // 요청 데이터를 JSON으로 직렬화
    );

    // 응답 처리
    if (response.statusCode == 200) {
      var responseData = jsonDecode(utf8.decode(response.bodyBytes));  // JSON 응답 파싱
      var assistantResponse = responseData['choices'][0]['message']['content'];
      return assistantResponse;
    } else {
      return '값 못가져옴';
    }

  }

}