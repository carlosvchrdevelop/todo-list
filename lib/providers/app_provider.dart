import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_state.dart';

class AppProvider with ChangeNotifier {
  final Box<Task> _tasksBox = Hive.box(BoxManager.taskBox);

  bool showPendingTasks = true;
  bool showDoneTasks = true;
  bool showOnlyPriorityTasks = false;
  bool showOverdueTasks = true;
  List<Task> _tasks = [];

  List<Task> get tasks {
    _tasks = _tasksBox.values.toList();
    _putEndedTasksAtBottom();
    _filter();
    return _tasks;
  }

  void _putEndedTasksAtBottom() {
    _tasks = _tasks.isEmpty
        ? []
        : [
            ..._tasks.where((element) => element.state != TaskState.done),
            ..._tasks.where((element) => element.state == TaskState.done),
          ];
  }

  void _filter() {
    _tasks = _tasks.where((e) {
      return !((!showPendingTasks && e.state == TaskState.pending) ||
          (!showOverdueTasks && e.state == TaskState.orverdue) ||
          (!showDoneTasks && e.state == TaskState.done) ||
          (showOnlyPriorityTasks && !e.priority));
    }).toList();
  }

  Box<Task> get taskBox {
    return _tasksBox;
  }

  bool getCurrentTaskState(TaskState state) {
    switch (state) {
      case TaskState.pending:
        return showPendingTasks;
      case TaskState.done:
        return showDoneTasks;
      case TaskState.orverdue:
        return showOverdueTasks;
      default:
        return false;
    }
  }

  Future<void> insertTask(Task t) async {
    await _tasksBox.put(t.id, t);
    updateTaskList();
  }

  Future<void> deleteTask(String id) async {
    await _tasksBox.delete(id);
    updateTaskList();
  }

  void updateTaskList() {
    _tasks = _tasksBox.values.toList();
    notifyListeners();
  }

  void clearCompletedTasks() async {
    List<Task> completedTasks =
        _tasks.where((element) => element.state == TaskState.done).toList();
    if (completedTasks.isNotEmpty) {
      for (var element in completedTasks) {
        await _tasksBox.delete(element.id);
      }
    }
    updateTaskList();
  }

  void applyFilters() {
    notifyListeners();
  }
}
