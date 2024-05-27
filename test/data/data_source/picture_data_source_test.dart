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
