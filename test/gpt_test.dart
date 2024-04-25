import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_project_orm_janggo/core/confige/chat_gpt_configue.dart';
import 'package:flutter_test/flutter_test.dart';


  void main() async {
    test("gpt test", () async {
      await dotenv.load(fileName: '.env');
      final apiKey = ChatGptConfigue.apiKey;
      final Uri baseUrl = Uri.parse(ChatGptConfigue.baseUrl);

      Map<String, dynamic> requestData = {
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant that provides recipe recommendations.'},
          {'role': 'user', 'content': 'Here are the ingredients I have: eggs, milk, flour, cheese, and tomatoes.'},
          {'role': 'user', 'content': 'Can you suggest some recipes I can make with these ingredients?'}
        ],
        'temperature': 0.7, // 다양성 설정(1이 최대) => 적당히 다양하게 설정해놈
        'max_tokens': 100  // 응답의 최대 토큰 수 설정
        //
      };

        final response = await http.post(
          baseUrl,
          headers: {
            'Authorization': 'Bearer $apiKey',  // API 키 인증
            'Content-Type': 'application/json'
          },
          body: jsonEncode(requestData),  // 요청 데이터를 JSON으로 직렬화
        );

        var responseData = jsonDecode(response.body);  // JSON 응답 파싱
        var assistantResponse = responseData['choices'][0]['message']['content'];
        expect(assistantResponse, isNotNull);
        print('Recommended recipes: $assistantResponse');  // 결과 출력

      });
    }

