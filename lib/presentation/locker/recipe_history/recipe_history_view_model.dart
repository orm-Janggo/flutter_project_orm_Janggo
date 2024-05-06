import 'package:flutter/cupertino.dart';

class RecipeHistoryViewModel with ChangeNotifier {
  List<Container> _listTiles = [Container()];

  List<Container> get listTiles => _listTiles;

  void removeList(int index) {
    if (_listTiles.length > 1) {
      _listTiles.removeAt(index);
      notifyListeners(); // 상태 변경을 UI에 알림
    }
  }
}
