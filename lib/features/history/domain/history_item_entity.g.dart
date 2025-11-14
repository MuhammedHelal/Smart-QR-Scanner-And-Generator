// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryItemEntityAdapter extends TypeAdapter<HistoryItemEntity> {
  @override
  final int typeId = 0;

  @override
  HistoryItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryItemEntity(
      data: fields[0] as String,
      date: fields[1] as String,
      qrData: fields[2] as String?,
      type: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryItemEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.qrData)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
