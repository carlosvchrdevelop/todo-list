import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_state.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/widgets/task_dialog.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return ListView.separated(
        itemBuilder: (context, index) {
          final bool isCompleted =
              provider.tasks[index].state == TaskState.done;
          return InkWell(
            onLongPress: () => showDialog(
                context: context,
                builder: (context) =>
                    TaskDialog(taskId: provider.tasks[index].id)),
            child: ListTile(
                title: Text(provider.tasks[index].title,
                    style: TextStyle(
                        color: isCompleted ? Colors.grey : Colors.black,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none)),
                trailing: IconButton(
                  icon: isCompleted
                      ? const Icon(Icons.check_circle_outline)
                      : const Icon(Icons.circle_outlined),
                  onPressed: () {
                    Task? currentTask =
                        provider.taskBox.get(provider.tasks[index].id);
                    if (currentTask != null) {
                      Task updatedTask = currentTask.getCopy(
                          state:
                              isCompleted ? TaskState.pending : TaskState.done);
                      provider.insertTask(updatedTask);
                    }
                  },
                )),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: provider.tasks.length);
  }
}
