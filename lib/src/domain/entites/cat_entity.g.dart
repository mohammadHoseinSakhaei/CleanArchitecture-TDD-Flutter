// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatEntityAdapter extends TypeAdapter<CatEntity> {
  @override
  final int typeId = 0;

  @override
  CatEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatEntity()
      ..data = (fields[0] as List?)?.cast<DataEntity>()
      ..links = (fields[1] as List?)?.cast<LinksEntity>()
      ..total = fields[2] as int?;
  }

  @override
  void write(BinaryWriter writer, CatEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.links)
      ..writeByte(2)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataEntityAdapter extends TypeAdapter<DataEntity> {
  @override
  final int typeId = 1;

  @override
  DataEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataEntity()
      ..breed = fields[0] as String?
      ..country = fields[1] as String?
      ..origin = fields[2] as String?
      ..coat = fields[3] as String?
      ..pattern = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, DataEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.breed)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.origin)
      ..writeByte(3)
      ..write(obj.coat)
      ..writeByte(4)
      ..write(obj.pattern);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LinksEntityAdapter extends TypeAdapter<LinksEntity> {
  @override
  final int typeId = 2;

  @override
  LinksEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LinksEntity()
      ..url = fields[0] as String?
      ..label = fields[1] as String?
      ..active = fields[2] as bool?;
  }

  @override
  void write(BinaryWriter writer, LinksEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.active);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinksEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
