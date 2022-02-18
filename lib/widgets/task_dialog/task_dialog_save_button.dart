import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/providers/app_provider.dart';

class TaskDialogSaveButton extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descrController;
  final String? taskId;
  const TaskDialogSaveButton(
      {Key? key,
      required this.taskId,
      required this.titleController,
      required this.descrController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return TextButton(
        onPressed: () {
          if (titleController.text.isNotEmpty) {
            String _id = taskId ?? '${DateTime.now().millisecondsSinceEpoch}';
            provider.insertTask(Task(
                id: _id,
                title: titleController.text,
                description: descrController.text));
            Navigator.pop(context);
          }
        },
        child: const Text('Save'));
  }
}
