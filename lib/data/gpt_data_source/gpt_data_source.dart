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
      },
      {
        'role': 'user',
        'content': '레시피에 상세한 재료와 조리 과정을 제외한 나머지 내용은 제거해주세요. 오로지 레시피, 재료, 조리 과정만 보여주십쇼'
      },
      {
        'role': 'user',
        'content': '결과를 List로 자르기 쉽도록 레시피 1,2,3의 사이사이에 "next" 텍스트를 끼워주십쇼'
      },
      {
        'role': 'user',
        'content': '다음과 같은 양식으로 결과를 보여주십쇼. "음식제목(간단하게 음식제목만 표시. 숫자 미포함)\n재료(1~n개의 재료 숫자 붙여 설명)\n조리과정(1~n개의 조리 과정 숫자 붙여 설명)"'
      },
      {
        'role': 'user',
        'content': '음식 제목부분은 오로지 음식 제목 단 하나만 써주십쇼. 숫자나 다른 텍스트 모두 제거하고 음식 제목만 써주십쇼. "1.김치찌개", "음식제목: 김치찌개" 이게 아니라 그냥 "김치찌개" 이런식으로만 써줘'
      },
      {
        'role': 'user',
        'content': '재료와 조리과정은 최대한 정성스럽고 자세하게 번호를 붙여가며 설명해주세요'
      },
    ],
    'temperature': 0.8,
    'max_tokens': 1000,  // 더 많은 레시피를 받기 위해 최대 토큰 수 증가
  };

  Future<List<String>> getRecipes(String ingredients) async {
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

    if (response.statusCode == 200) {
      String assistantResponse = jsonDecode(utf8.decode(response.bodyBytes))['choices'][0]['message']['content'];

      // '레시피 1:', '레시피 2:', '레시피 3:'과 같은 구분자를 찾아내어 레시피를 분리
      final List<String> recipes = assistantResponse.split('next');
      final List<String> trimmedRecipes = recipes.map((recipe) => recipe.trim()).toList();

      if (trimmedRecipes.isEmpty) {
        return ['레시피를 찾을 수 없습니다.'];
      }

      return trimmedRecipes; // 레시피를 리스트로 반환
    } else {
      return ['API 요청이 실패했습니다.'];
    }

  }

}