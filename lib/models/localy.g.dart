// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalyAdapter extends TypeAdapter<Localy> {
  @override
  final int typeId = 0;

  @override
  Localy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Localy(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Localy obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
