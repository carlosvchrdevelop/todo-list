import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/app_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(title: Text(provider.tasks[index].title));
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: provider.tasks.length);
  }
}
