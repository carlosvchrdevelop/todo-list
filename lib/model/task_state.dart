import 'package:hive/hive.dart';

part 'task_state.g.dart';

@HiveType(typeId: 2)
enum TaskState {
  @HiveField(0)
  pending,

  @HiveField(1)
  orverdue,

  @HiveField(2)
  done,

  @HiveField(3)
  deleted,
}
