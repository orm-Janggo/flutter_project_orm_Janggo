import 'package:flutter_project_orm_janggo/data/db/history/history_recipe_data.dart';
import 'package:hive/hive.dart';

class HistoryRecipeDataAdapter extends TypeAdapter<HistoryRecipeData> {
  @override
  final int typeId = 1;

  @override
  HistoryRecipeData read(BinaryReader reader) {
    return HistoryRecipeData(
      reader.readInt(),
      reader.readString(),
      reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, HistoryRecipeData obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.recipe);
    writer.writeString(obj.imagePath);
  }
}
