import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/src/view_type.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog.dart';
import 'package:todo_list/widgets/task_list/task_list_tile_body.dart';
import 'package:todo_list/widgets/task_list/task_list_tile_header.dart';

class TaskListTile extends StatefulWidget {
  final Task task;
  const TaskListTile({Key? key, required this.task}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return InkWell(
      onLongPress: () => showDialog(
          context: context,
          builder: (context) => TaskDialog(taskId: widget.task.id)),
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical:
                ViewTypeManager.getViewTypeSize(settingsProvider.viewType),
            horizontal: 0),
        child: Column(
          children: [
            TaskListTileHeader(
              task: widget.task,
              isExpanded: _isExpanded,
            ),
            TaskListTileBody(task: widget.task, isExpanded: _isExpanded)
          ],
        ),
      ),
    );
  }
}
