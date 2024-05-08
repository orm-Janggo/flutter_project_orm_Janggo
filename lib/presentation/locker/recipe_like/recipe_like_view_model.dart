import 'package:flutter/cupertino.dart';
import 'package:flutter_project_orm_janggo/data/db/like_hive/like_hive_service.dart';

import '../../../data/db/like_hive/like_item.dart';

class RecipeLikeViewModel with ChangeNotifier{
   final LikeBox _likeBox;

   RecipeLikeViewModel({
    required LikeBox likeBox,
  }) : _likeBox = likeBox;

   List<LikeItem> _likeItems = [];

   List<LikeItem> get likeItems => _likeItems;

   Future<void> addLikeItem(LikeItem item) async{
     await _likeBox.addLikeItem(item);
     _likeItems.add(item);
     notifyListeners();
   }

   Future<void> loadLikeItem() async{
     _likeItems = await _likeBox.getLikeItems();
     notifyListeners();
   }
}