import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/model/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Box<Task> tasksBox = Hive.box(BoxManager.taskBox);
    List<Task> tasks = tasksBox.values.toList();
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(title: Text(tasks[index].title));
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tasks.length);
  }
}
