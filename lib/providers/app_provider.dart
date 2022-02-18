import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_state.dart';

class AppProvider with ChangeNotifier {
  final Box<Task> _tasksBox = Hive.box(BoxManager.taskBox);
  List<Task> _tasks = [];

  List<Task> get tasks {
    if (_tasks.isEmpty) _tasks = _tasksBox.values.toList();
    return _tasks;
  }

  Box<Task> get taskBox {
    return _tasksBox;
  }

  Future<void> insertTask(Task t) async {
    await _tasksBox.put(t.id, t);
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
}
