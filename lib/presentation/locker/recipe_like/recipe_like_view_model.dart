import 'package:flutter/cupertino.dart';

import '../../../data/db/like_hive/like_adapter.dart';
import '../../../data/db/like_hive/like_item.dart';

class RecipeLikeViewModel with ChangeNotifier {
  final LikeBoxAdapter _likeBoxAdapter;

  List<LikeItem> _likeItems = [];
  List<LikeItem> _filteredLikeItems = [];

  List<LikeItem> get likeItems => _likeItems;

  List<LikeItem> get filteredLikeItems => _filteredLikeItems;

  void search(String query) {
    _filteredLikeItems = _likeItems
        .where(
            (e) => e.title.toLowerCase().trim().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> addLikeItem(LikeItem item) async {
    await _likeBoxAdapter.addItem(item);
    _likeItems.add(item);
    notifyListeners();
  }

  Future<void> removeLikeItem(int index) async {
    await _likeBoxAdapter.removeItem(index);
    _likeItems.removeAt(index);
    notifyListeners();
  }

  Future<void> loadLikeItem() async {
    _likeItems = await _likeBoxAdapter.getItems();
    notifyListeners();
  }

  RecipeLikeViewModel({
    required LikeBoxAdapter likeBoxAdapter,
  }) : _likeBoxAdapter = likeBoxAdapter;
}
