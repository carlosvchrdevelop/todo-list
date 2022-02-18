// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStateAdapter extends TypeAdapter<TaskState> {
  @override
  final int typeId = 2;

  @override
  TaskState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskState.pending;
      case 1:
        return TaskState.orverdue;
      case 2:
        return TaskState.done;
      case 3:
        return TaskState.deleted;
      default:
        return TaskState.pending;
    }
  }

  @override
  void write(BinaryWriter writer, TaskState obj) {
    switch (obj) {
      case TaskState.pending:
        writer.writeByte(0);
        break;
      case TaskState.orverdue:
        writer.writeByte(1);
        break;
      case TaskState.done:
        writer.writeByte(2);
        break;
      case TaskState.deleted:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
