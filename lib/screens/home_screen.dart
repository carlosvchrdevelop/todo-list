import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/screens/settings_screen.dart';
import 'package:todo_list/widgets/filter_dialog.dart';
import 'package:todo_list/widgets/task_dialog/task_dialog.dart';
import 'package:todo_list/widgets/task_list/task_list.dart';

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
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen())),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const TaskList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: FittedBox(
              child: FloatingActionButton(
                  heroTag: 'filterBtn',
                  child: const Icon(Icons.filter_alt),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const FilterDialog())),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 48,
            height: 48,
            child: FittedBox(
              child: FloatingActionButton(
                  heroTag: 'clearBtn',
                  child: const Icon(Icons.cleaning_services),
                  onPressed: () => provider.clearCompletedTasks()),
            ),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'addTaskBtn',
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => const TaskDialog());
            },
          ),
        ],
      ),
    );
  }
}
