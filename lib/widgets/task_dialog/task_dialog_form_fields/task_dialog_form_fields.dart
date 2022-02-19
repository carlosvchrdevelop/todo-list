import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/lang/lang.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog_form_fields/text_field_task_dialog.dart';

class TaskDialogFormFields extends StatelessWidget {
  final String? taskId;
  final TextEditingController titleController;
  final TextEditingController descrController;
  const TaskDialogFormFields(
      {Key? key,
      this.taskId,
      required this.titleController,
      required this.descrController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    Task? currentTask = (taskId != null && provider.taskBox.get(taskId) != null)
        ? provider.taskBox.get(taskId)
        : null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFieldTaskDialog(
            minLines: 1,
            maxLines: 3,
            labelText: Lang.title,
            controller: titleController
              ..text = currentTask != null ? currentTask.title : ''),
        const SizedBox(height: 12),
        TextFieldTaskDialog(
          minLines: 6,
          maxLines: 8,
          labelText: Lang.description,
          controller: descrController
            ..text = currentTask != null ? currentTask.description ?? '' : '',
        )
      ],
    );
  }
}
