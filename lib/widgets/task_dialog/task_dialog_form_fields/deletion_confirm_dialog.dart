import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/lang/lang.dart';
import 'package:todo_list/providers/app_provider.dart';

class DeletionConfirmDialog extends StatelessWidget {
  final String taskId;
  const DeletionConfirmDialog({Key? key, required this.taskId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return AlertDialog(
      content: Text(Lang.deletionConfirm),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text(Lang.cancel)),
        TextButton(
            onPressed: () {
              provider.deleteTask(taskId);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              Lang.remove,
              style: const TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}
