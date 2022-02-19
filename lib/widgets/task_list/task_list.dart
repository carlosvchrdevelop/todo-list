import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/widgets/task_list/task_list_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return ListView.separated(
        itemBuilder: (context, index) {
          return TaskListTile(task: provider.tasks[index]);
        },
        separatorBuilder: (_, __) => const Divider(
              height: 1,
            ),
        itemCount: provider.tasks.length);
  }
}
