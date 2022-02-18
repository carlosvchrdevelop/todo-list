import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog_form_fields/deletion_confirm_dialog.dart';

class TaskDialogTitle extends StatelessWidget {
  final String? taskId;
  const TaskDialogTitle({Key? key, this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return taskId == null
        ? const Text('Add new task')
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Edit task'),
              IconButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) =>
                          DeletionConfirmDialog(taskId: taskId!)),
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                  ))
            ],
          );
  }
}
