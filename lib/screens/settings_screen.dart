import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/lang/lang.dart';
import 'package:todo_list/lang/language.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/themes/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(Lang.settings)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          DropdownButton<String>(
              value: provider.appColor,
              items: AppTheme.colorKeys
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: ColoredBox(
                        color: AppTheme.getColor(e),
                        child: const SizedBox(
                          height: 32,
                          width: 150,
                        ),
                      )))
                  .toList(),
              onChanged: (String? newColor) {
                provider.setAppColor(newColor!);
              }),
          DropdownButton<Language>(
              value: provider.language,
              items: Lang.getLanguages()
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(Lang.getLanguageLabel(e)),
                      ))
                  .toList(),
              onChanged: (Language? newLang) {
                provider.setLanguage(newLang!);
                SnackBar snackBar = SnackBar(
                  duration: const Duration(seconds: 3),
                  content: Text(Lang.getNeedsRestart(newLang)),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ]),
      ),
    );
  }
}
