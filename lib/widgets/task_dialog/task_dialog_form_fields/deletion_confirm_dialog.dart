import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/app_provider.dart';

class DeletionConfirmDialog extends StatelessWidget {
  final String taskId;
  const DeletionConfirmDialog({Key? key, required this.taskId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return AlertDialog(
      content: const Text('Please, confirm that you want to remove the task.'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              provider.deleteTask(taskId);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}
