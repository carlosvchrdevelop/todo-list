import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/lang/lang.dart';
import 'package:todo_list/model/task_state.dart';
import 'package:todo_list/providers/app_provider.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return AlertDialog(
      title: Text(Lang.filter),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        ...TaskStateManager.getStateFilters()
            .map((e) => CheckboxListTile(
                value: provider.getCurrentTaskState(e),
                onChanged: (bool? newValue) {
                  switch (e) {
                    case TaskState.pending:
                      provider.showPendingTasks = newValue ?? false;
                      provider.applyFilters();
                      break;
                    case TaskState.done:
                      provider.showDoneTasks = newValue ?? false;
                      provider.applyFilters();
                      break;
                    case TaskState.orverdue:
                      provider.showOverdueTasks = newValue ?? false;
                      provider.applyFilters();
                      break;
                    default:
                  }
                },
                title: Text(TaskStateManager.getStateLabel(e))))
            .toList(),
        CheckboxListTile(
            title: Text(Lang.onlyPriority),
            value: provider.showOnlyPriorityTasks,
            onChanged: (bool? newValue) {
              provider.showOnlyPriorityTasks = newValue ?? false;
              provider.applyFilters();
            })
      ]),
      actions: [
        TextButton(
            onPressed: () {
              provider.showDoneTasks = true;
              provider.showOverdueTasks = true;
              provider.showPendingTasks = true;
              provider.showOnlyPriorityTasks = false;
              provider.applyFilters();
            },
            child: Text(Lang.reset)),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(Lang.close))
      ],
    );
  }
}
