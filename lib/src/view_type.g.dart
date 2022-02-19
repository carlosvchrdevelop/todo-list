// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViewTypeAdapter extends TypeAdapter<ViewType> {
  @override
  final int typeId = 4;

  @override
  ViewType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ViewType.regular;
      case 1:
        return ViewType.compact;
      case 2:
        return ViewType.comfortable;
      default:
        return ViewType.regular;
    }
  }

  @override
  void write(BinaryWriter writer, ViewType obj) {
    switch (obj) {
      case ViewType.regular:
        writer.writeByte(0);
        break;
      case ViewType.compact:
        writer.writeByte(1);
        break;
      case ViewType.comfortable:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
