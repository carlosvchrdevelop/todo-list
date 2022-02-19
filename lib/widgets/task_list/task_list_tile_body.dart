import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

class TaskListTileBody extends StatelessWidget {
  final Task task;
  final bool isExpanded;
  const TaskListTileBody(
      {Key? key, required this.task, required this.isExpanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        child: task.description == null || task.description!.isEmpty
            ? const SizedBox(height: 0)
            : Padding(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    task.description!,
                    textAlign: TextAlign.justify,
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 0, bottom: 12, left: 12, right: 24),
              ),
        visible: isExpanded);
  }
}
