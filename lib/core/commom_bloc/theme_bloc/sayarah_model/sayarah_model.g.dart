// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sayarah_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SayarahModelAdapter extends TypeAdapter<SayarahModel> {
  @override
  final int typeId = 0;

  @override
  SayarahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SayarahModel(
      id: fields[0] as String?,
      channelName: fields[1] as String?,
      lastWorkingVer: fields[2] as int?,
      versionMsg: fields[3] as dynamic,
      status: fields[4] as String?,
      statusMsg: fields[5] as dynamic,
      baseUrl: fields[6] as String?,
      webviewUrl: fields[7] as String?,
      copyright: fields[8] as String?,
      setting: (fields[9] as List?)?.cast<dynamic>(),
      createdBy: fields[10] as dynamic,
      updatedBy: fields[11] as dynamic,
      createdAt: fields[12] as DateTime?,
      updatedAt: fields[13] as DateTime?,
      deletedAt: fields[14] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SayarahModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.channelName)
      ..writeByte(2)
      ..write(obj.lastWorkingVer)
      ..writeByte(3)
      ..write(obj.versionMsg)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.statusMsg)
      ..writeByte(6)
      ..write(obj.baseUrl)
      ..writeByte(7)
      ..write(obj.webviewUrl)
      ..writeByte(8)
      ..write(obj.copyright)
      ..writeByte(9)
      ..write(obj.setting)
      ..writeByte(10)
      ..write(obj.createdBy)
      ..writeByte(11)
      ..write(obj.updatedBy)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SayarahModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
