import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/model/task.dart';

class AppProvider with ChangeNotifier {
  final Box<Task> tasksBox = Hive.box(BoxManager.taskBox);
  List<Task> _tasks = [];

  List<Task> get tasks {
    if (_tasks.isEmpty) _tasks = tasksBox.values.toList();
    return _tasks;
  }

  void updateTaskList() {
    _tasks = tasksBox.values.toList();
    notifyListeners();
  }
}
