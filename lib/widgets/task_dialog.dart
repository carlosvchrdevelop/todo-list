import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/widgets/text_field_task_dialog.dart';

class TaskDialog extends StatelessWidget {
  final String? taskId;
  const TaskDialog({Key? key, this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    TextEditingController titleController = TextEditingController();
    TextEditingController descrController = TextEditingController();

    Task? currentTask = (taskId != null && provider.taskBox.get(taskId) != null)
        ? provider.taskBox.get(taskId)
        : null;

    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      title: taskId == null
          ? const Text('Add new task')
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Edit task'),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: const Text(
                                    'Please, confirm that you want to remove the task'),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel')),
                                  TextButton(
                                      onPressed: () {
                                        provider.deleteTask(taskId!);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.red),
                                      ))
                                ],
                              ));
                    },
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.red,
                    ))
              ],
            ),
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
                String _id = '${DateTime.now().millisecondsSinceEpoch}';
                provider.insertTask(Task(
                    id: _id,
                    title: titleController.text,
                    description: descrController.text));
                Navigator.pop(context);
              }
            },
            child: const Text('Save'))
      ],
    );
  }
}
