import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project_orm_janggo/data/data_source/picture_data_source.dart';
import 'package:flutter_project_orm_janggo/data/gpt_data_source/gpt_data_source.dart';
import 'package:flutter_project_orm_janggo/data/repository/chat_gpt_repository_impl.dart';
import 'package:flutter_project_orm_janggo/data/repository/picture_repository_impl.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case/get_picture_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_screen/recipe_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   test('pixabay test', () async {
//     await dotenv.load(fileName: '.env');
//     final dataSource = PictureDataSource();
//     final recipe = RecipeViewModel(
//       getPictureUseCase: GetPictureUseCase(repository: PictureRepositoryImpl(pictureDataSource: dataSource)),
//       getRecipeUseCase: GetRecipeUseCase(
//         chatGptRepositoryImpl: ChatGptRepositoryImpl(
//           dataSource: GptDataSource(),
//         ),
//       ),
//     );
//     recipe.getPicture(['김치찌개']);
//     final state = recipe.state;
//     expect(state.url, isNotNull);
//   });
// }
