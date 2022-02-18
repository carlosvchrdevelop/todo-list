import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/widgets/text_field_task_dialog.dart';

class TaskDialog extends StatelessWidget {
  final int? taskId;
  const TaskDialog({Key? key, this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    Box<Task> tasksBox = Hive.box(BoxManager.taskBox);
    TextEditingController titleController = TextEditingController();
    TextEditingController descrController = TextEditingController();

    Task? currentTask = (taskId != null && tasksBox.get(taskId) != null)
        ? tasksBox.get(taskId)
        : null;

    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      title: Text(taskId == null ? 'Add new task' : 'Edit task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldTaskDialog(
              minLines: 1,
              maxLines: 3,
              labelText: 'Title',
              controller: titleController
                ..text = currentTask != null ? currentTask.title : ''),
          const SizedBox(height: 12),
          TextFieldTaskDialog(
            minLines: 6,
            maxLines: 8,
            labelText: 'Description',
            controller: descrController
              ..text = currentTask != null ? currentTask.description ?? '' : '',
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                tasksBox.put(
                    '${DateTime.now().millisecondsSinceEpoch}',
                    Task(
                        title: titleController.text,
                        description: descrController.text));
                provider.updateTaskList();
                Navigator.pop(context);
              }
            },
            child: const Text('Save'))
      ],
    );
  }
}
