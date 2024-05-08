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
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LikeItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.recipe)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.isLiked);
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
