import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_state.dart';
import 'package:todo_list/providers/app_provider.dart';

class TaskListTileHeader extends StatelessWidget {
  final Task task;
  final bool isExpanded;
  const TaskListTileHeader(
      {Key? key, required this.task, required this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final bool isCompleted = task.state == TaskState.done;
    return ListTile(
        minLeadingWidth: 0,
        title: Text(task.title,
            style: TextStyle(
                color: isCompleted ? Colors.grey : Colors.black,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none)),
        leading: isExpanded
            ? const Icon(Icons.arrow_drop_down_outlined)
            : const Icon(Icons.arrow_right_outlined),
        trailing: IconButton(
          icon: isCompleted
              ? const Icon(Icons.check_circle_outline)
              : const Icon(Icons.circle_outlined),
          onPressed: () {
            Task? currentTask = provider.taskBox.get(task.id);
            if (currentTask != null) {
              Task updatedTask = currentTask.getCopy(
                  state: isCompleted ? TaskState.pending : TaskState.done);
              provider.insertTask(updatedTask);
            }
          },
        ));
  }
}
