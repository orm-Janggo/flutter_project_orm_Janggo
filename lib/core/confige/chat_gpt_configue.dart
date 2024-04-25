import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatGptConfigue {
  static final String baseUrl = dotenv.env['GPT_API_BASE_URL'].toString();
  static final String apiKey = dotenv.env['GPT_API_KEY'].toString();
}