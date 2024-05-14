import 'package:flutter/foundation.dart';
import 'package:flutter_project_orm_janggo/data/db/history/history_recipe_data.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_add_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_remove_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_screen/recipe_state.dart';
import '../../data/db/like_hive/like_item.dart';
import '../../main.dart';

class RecipeViewModel with ChangeNotifier {
  final GetPictureUseCase _getPictureUseCase;
  final GetRecipeUseCase _getRecipeUseCase;
  final LikeAddRecipeUseCase _likeAddRecipeUseCase;
  final LikeRemoveRecipeUseCase _likeRemoveRecipeUseCase;

  RecipeState _state = const RecipeState();

  RecipeState get state => _state;

  void getPicture(List<String> query) async {
    if (_state.url.length == query.length) {
      // 검색이 이미 완료되었다면 추가 검색을 방지
      return;
    }
    List<String> images = [];
    try {
      for (String recipe in query) {
        final recipeTitle = recipe.split('\n')[0].trim();
        final pic = await _getPictureUseCase.execute(recipeTitle);

        if (pic == null || pic.url == null || pic.url.isEmpty) {
          images.add("empty"); // 이미지가 없는 경우
        } else {
          images.add(pic.url); // 이미지 URL 추가
        }
      }

      _state = _state.copyWith(url: images);

      addDataListToHive(state.url, state.recipe);

      print(_state.url);
      notifyListeners();
    } catch (e) {
      print("Error in getPicture: $e"); // 예외 처리
    }
  }

  void getRecipe(String ingredients) async {
    final recipe = await _getRecipeUseCase.execute(ingredients);
    _state = _state.copyWith(recipe: recipe);
    _adjustIsLikeList();
    _addIds();
    notifyListeners();
  }

  Future<void> addLikeItem(LikeItem item) async {
    // 레시피 텍스트에서 음식 이름 추출
    print(state.isLike);
    String foodName = '';

    // 레시피 텍스트를 줄 단위로 분할하여 처리
    List<String> lines = item.recipe.split('\n');

    // 레시피 이름 추출
    for (int i = 0; i < lines.length; i++) {
      // 현재 줄의 텍스트
      String line = lines[i].trim();

      // 음식 이름이 아니면 다음 줄로 넘어감
      if (line.isEmpty || line.toLowerCase().contains('레시피')) {
        continue;
      }

      // 번호가 있으면 제거
      if (line.startsWith(RegExp(r'\d+\. '))) {
        line = line.substring(line.indexOf(' ') + 1);
      }

      // 텍스트가 너무 길면 음식 이름이 아니라고 판단하여 루프 종료
      if (line.length > 20) {
        break;
      }

      // 음식 이름 추출 완료
      foodName = line;
      break;
    }

    final recipe = item.recipe.replaceFirst(foodName, '').trim();

    final updatedItem = item.copyWith(
      foodName: foodName,
      recipe: recipe,
      id: item.id,
      imageUrl: item.imageUrl,
      isLiked: item.isLiked,
      time: item.time,
    );

    await _likeAddRecipeUseCase.execute(updatedItem);
    _state = state.copyWith(foodName: foodName);

    notifyListeners();
  }

  Future<void> removeLikeItem(LikeItem item) async {
    await _likeRemoveRecipeUseCase.execute(item);
    notifyListeners();
  }

  void toggleLike(int index, bool isLiked) {
    // isLike 리스트의 복사본을 만든다
    final newIsLike = List<bool>.from(_state.isLike);

    // 인덱스에 해당하는 값을 변경한다
    newIsLike[index] = isLiked;

    // 복사본을 사용하여 state를 업데이트한다
    _state = _state.copyWith(isLike: newIsLike);
    print(_state.isLike);

    // 변경 사항을 알린다
    notifyListeners();
  }

  void _adjustIsLikeList() {
    final recipeLength = _state.recipe.length;
    final isLikeLength = _state.isLike.length;

    // 레시피 길이가 더 크다면 isLike를 false로 채운다
    if (isLikeLength < recipeLength) {
      _state = _state.copyWith(
        isLike: List<bool>.filled(recipeLength, false),
      );
      notifyListeners(); // 업데이트 후 변경 사항 알림
    }
  }

  void _addIds() {
    List<int> newIds = [];

    if (likeBox.isEmpty) {
      // likeBox가 비어있을 때
      for (int i = 1; i <= 3; i++) {
        newIds.add(i);
      }
    } else {
      // likeBox에 이미 아이템이 있는 경우
      int maxId = likeBox.values
          .map((item) => int.parse(item.id))
          .reduce((value, element) => value > element ? value : element);
      for (int i = maxId + 1; i <= maxId + 3; i++) {
        newIds.add(i);
      }
    }
    _state = _state.copyWith(id: newIds);
  }

  Future<void> addDataListToHive(
      List<String> imagePathList, List<String> recipeList) async {
    Box box = Hive.box<HistoryRecipeData>('historyRecipeBox');

    // 박스의 길이를 id로 사용하여 새로운 id를 생성
    int nextId = box.length;

    for (int i = 0; i < imagePathList.length; i++) {
      String imagePath = imagePathList[i];
      String recipe = recipeList[i];
      String date = '${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}';

      box.add(HistoryRecipeData(nextId++, imagePath, recipe, date));
    }


    print('---------------------------add 완료');
  }

  RecipeViewModel({
    required GetPictureUseCase getPictureUseCase,
    required GetRecipeUseCase getRecipeUseCase,
    required LikeAddRecipeUseCase likeAddRecipeUseCase,
    required LikeRemoveRecipeUseCase likeRemoveRecipeUseCase,
  })  : _getPictureUseCase = getPictureUseCase,
        _getRecipeUseCase = getRecipeUseCase,
        _likeAddRecipeUseCase = likeAddRecipeUseCase,
        _likeRemoveRecipeUseCase = likeRemoveRecipeUseCase;
}
