import 'package:hive/hive.dart';

part 'history_recipe_data.g.dart';

@HiveType(typeId: 1)
class HistoryRecipeData extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String imagePath;

  @HiveField(2)
  late String recipe;

  @HiveField(3)
  late String date;

  HistoryRecipeData(this.id, this.imagePath, this.recipe, this.date);
}
