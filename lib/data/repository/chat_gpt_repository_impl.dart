import 'package:flutter_project_orm_janggo/data/gpt_data_source/gpt_data_source.dart';
import 'package:flutter_project_orm_janggo/domain/repository/chat_gpt_repository.dart';

class ChatGptRepositoryImpl implements ChatGptrepository {
  final GptDataSource _dataSource;

  const ChatGptRepositoryImpl({
    required GptDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<String>> getRecipes(String ingredients) async {
    final recipe = await _dataSource.getRecipes(ingredients);
    return recipe;
  }

}