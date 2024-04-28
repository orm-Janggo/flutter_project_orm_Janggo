import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_reopository_impl.dart';

class GetRecipeUseCase {
  final ChatGptRepositoryImpl _chatGptRepositoryImpl;

  const GetRecipeUseCase({
    required ChatGptRepositoryImpl chatGptRepositoryImpl,
  }) : _chatGptRepositoryImpl = chatGptRepositoryImpl;

  Future<String> execute(String ingredients) async {
    final recipe = await _chatGptRepositoryImpl.getRecipes(ingredients);
    return recipe;
  }

}