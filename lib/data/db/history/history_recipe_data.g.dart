// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_recipe_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryRecipeDataAdapter extends TypeAdapter<HistoryRecipeData> {
  @override
  final int typeId = 1;

  @override
  HistoryRecipeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryRecipeData(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryRecipeData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(2)
      ..write(obj.recipe)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryRecipeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
