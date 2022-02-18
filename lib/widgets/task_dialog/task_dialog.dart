import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog_cancel_button.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog_form_fields/task_dialog_form_fields.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog_save_button.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog_title.dart';

class TaskDialog extends StatelessWidget {
  final String? taskId;
  const TaskDialog({Key? key, this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descrController = TextEditingController();

    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      title: TaskDialogTitle(taskId: taskId),
      content: TaskDialogFormFields(
          taskId: taskId,
          titleController: titleController,
          descrController: descrController),
      actions: [
        const TaskDialogCancelButton(),
        TaskDialogSaveButton(
            taskId: taskId,
            titleController: titleController,
            descrController: descrController)
      ],
    );
  }
}
