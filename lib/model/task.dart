import 'package:hive/hive.dart';
import 'package:todo_list/model/task_state.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final TaskState state;

  const Task(
      {required this.title, this.description, this.state = TaskState.pending});
}
