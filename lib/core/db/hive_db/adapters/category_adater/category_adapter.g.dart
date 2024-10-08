// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryDBAdapter extends TypeAdapter<CategoryDB> {
  @override
  final int typeId = 2;

  @override
  CategoryDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryDB(
      name: fields[0] as dynamic,
      slug: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
