// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikeItemAdapter extends TypeAdapter<LikeItem> {
  @override
  final int typeId = 0;

  @override
  LikeItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikeItem(
      recipe: fields[0] as String,
      id: fields[1] as String,
      imageUrl: fields[2] as String,
      isLiked: fields[3] as bool,
      foodName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LikeItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.recipe)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.isLiked)
      ..writeByte(4)
      ..write(obj.foodName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikeItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
