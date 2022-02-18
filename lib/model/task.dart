import 'package:hive/hive.dart';
import 'package:todo_list/model/task_state.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(3)
  final String id;

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final TaskState state;

  @HiveField(4)
  final String? dueDate;

  const Task(
      {required this.id,
      required this.title,
      this.description,
      this.state = TaskState.pending,
      this.dueDate});

  Task getCopy(
      {String? id,
      String? title,
      String? description,
      TaskState? state,
      String? dueDate}) {
    return Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        state: state ?? this.state,
        dueDate: dueDate ?? this.dueDate);
  }
}
