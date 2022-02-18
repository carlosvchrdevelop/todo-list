import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_state.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/screens/home_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter<Task>(TaskAdapter())
    ..registerAdapter<TaskState>(TaskStateAdapter());

  await Hive.openBox<Task>(BoxManager.taskBox);

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
