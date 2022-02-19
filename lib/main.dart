import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/screens/home_screen.dart';
import 'package:todo_list/themes/app_theme.dart';

Future<void> main() async {
  await BoxManager.initHive();

  SettingsProvider settingsProvider = SettingsProvider();
  await settingsProvider.initizalizeValues();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AppProvider()),
    ChangeNotifierProvider(create: (_) => settingsProvider)
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: AppTheme.getColor(settingsProvider.appColor),
      ),
      home: const HomeScreen(),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
