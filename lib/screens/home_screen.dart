import 'package:flutter/material.dart';
import 'package:todo_list/widgets/task_dialog.dart';
import 'package:todo_list/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To do list')),
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
