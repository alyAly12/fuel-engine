// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'handheld_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HandHeldModelAdapter extends TypeAdapter<HandHeldModel> {
  @override
  final int typeId = 2;

  @override
  HandHeldModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HandHeldModel(
      data: fields[0] as PairingDataModel?,
      message: fields[1] as String?,
      error: (fields[2] as List?)?.cast<dynamic>(),
      status: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HandHeldModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.error)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HandHeldModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
