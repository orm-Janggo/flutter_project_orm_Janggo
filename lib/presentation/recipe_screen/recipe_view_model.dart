import 'package:flutter/foundation.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_picture_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/get_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_add_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_remove_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/domain/use_case/like_recipe_use_case/like_search_recipe_use_case.dart';
import 'package:flutter_project_orm_janggo/presentation/recipe_screen/recipe_state.dart';

import '../../data/db/like_hive/like_adapter.dart';
import '../../data/db/like_hive/like_item.dart';
import '../../domain/use_case/like_recipe_use_case/like_load_recipe_use_case.dart';

class RecipeViewModel with ChangeNotifier {
  final GetPictureUseCase _getPictureUseCase;
  final GetRecipeUseCase _getRecipeUseCase;
  final LikeAddRecipeUseCase _likeAddRecipeUseCase;
  final LikeLoadRecipeUseCase _likeLoadRecipeUseCase;
  final LikeRemoveRecipeUseCase _likeRemoveRecipeUseCase;
  final LikeSearchRecipeUseCase _likeSearchRecipeUseCase;
  final LikeBoxAdapter _likeBoxAdapter;


  List<LikeItem?> _likeItems = [];


  RecipeState _state = const RecipeState();

  RecipeState get state => _state;

  List<LikeItem?> get likeItems => _likeItems;


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
    notifyListeners();
  }

  void search(String query) async {
    _likeItems = (await _likeSearchRecipeUseCase.execute(query)) ;
    notifyListeners();
  }

  void loadItem(LikeItem item) {
    _likeItems = (_likeLoadRecipeUseCase.execute(item)) ;
    notifyListeners();
  }


  Future<void> addLikeItem(LikeItem item) async {
    await _likeAddRecipeUseCase.execute(item);

    notifyListeners();

    final addLikeList = <bool>[];

    for (int i = 0; i < state.isLike.length; i++) {
      addLikeList.add(state.isLike[i]);
    }

    print(addLikeList);
    _state = state.copyWith(isLike: addLikeList);
    notifyListeners();
  }

  Future<void> removeLikeItem(LikeItem item) async {
    await _likeRemoveRecipeUseCase.execute(item);
    loadItem(item);
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

  RecipeViewModel({
    required GetPictureUseCase getPictureUseCase,
    required GetRecipeUseCase getRecipeUseCase,
    required LikeAddRecipeUseCase likeAddRecipeUseCase,
    required LikeLoadRecipeUseCase likeLoadRecipeUseCase,
    required LikeRemoveRecipeUseCase likeRemoveRecipeUseCase,
    required LikeSearchRecipeUseCase likeSearchRecipeUseCase,
    required LikeBoxAdapter likeBoxAdapter,
  })
      : _getPictureUseCase = getPictureUseCase,
        _getRecipeUseCase = getRecipeUseCase,
        _likeAddRecipeUseCase = likeAddRecipeUseCase,
        _likeLoadRecipeUseCase = likeLoadRecipeUseCase,
        _likeRemoveRecipeUseCase = likeRemoveRecipeUseCase,
        _likeSearchRecipeUseCase = likeSearchRecipeUseCase,
        _likeBoxAdapter = likeBoxAdapter;

}


