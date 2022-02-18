import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/widgets/task_dialog.dart';
import 'package:todo_list/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
        actions: [
          IconButton(
              onPressed: () {
                provider.clearCompletedTasks();
              },
              icon: const Icon(Icons.cleaning_services))
        ],
      ),
      body: const TaskList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context, builder: (context) => const TaskDialog());
        },
      ),
    );
  }
}
