import 'package:hive/hive.dart';
import 'package:todo_list/lang/lang.dart';

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

class TaskStateManager {
  static List<TaskState> getStateFilters() {
    return [TaskState.pending, TaskState.orverdue, TaskState.done];
  }

  static String getStateLabel(TaskState state) {
    switch (state) {
      case TaskState.done:
        return Lang.stateDone;
      case TaskState.orverdue:
        return Lang.stateOverdue;
      default:
        return Lang.statePending;
    }
  }
}
