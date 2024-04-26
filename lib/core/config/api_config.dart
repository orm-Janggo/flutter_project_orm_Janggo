import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatGptConfig {
  static final String baseUrl = dotenv.env['GPT_API_BASE_URL'].toString();
  static final String apiKey = dotenv.env['GPT_API_KEY'].toString();
}

class PixabayConfig {
  static final String baseUrl = dotenv.env['PIXABAY_BASE_URL'].toString();
  static final String apiKey = dotenv.env['PIXABAY_API_KEY'].toString();
}

class KakaoConfig {
  static final String nativeAppKey = dotenv.env['KAKAO_NATIVE_APP_KEY'].toString();
  static final String javascriptKey = dotenv.env['KAKAO_JAVASCRIPT_KEY'].toString();
}
