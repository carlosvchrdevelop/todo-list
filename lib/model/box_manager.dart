import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/lang/language.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_state.dart';
import 'package:todo_list/src/view_type.dart';

class BoxManager {
  static const taskBox = 'tasks';
  static const settingBox = 'settings';

  static Future<void> initHive() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter<Task>(TaskAdapter())
      ..registerAdapter<TaskState>(TaskStateAdapter())
      ..registerAdapter<Language>(LanguageAdapter())
      ..registerAdapter<ViewType>(ViewTypeAdapter());

    await Hive.openBox<Task>(taskBox);
    await Hive.openBox<dynamic>(settingBox);
  }
}
