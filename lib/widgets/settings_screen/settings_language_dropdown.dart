import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/lang/lang.dart';
import 'package:todo_list/lang/language.dart';
import 'package:todo_list/providers/settings_provider.dart';

class SettingsLanguageDropdown extends StatelessWidget {
  final double width;
  const SettingsLanguageDropdown({Key? key, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return DropdownButton<Language>(
        value: provider.language,
        items: Lang.getLanguages()
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: SizedBox(
                      width: width, child: Text(Lang.getLanguageLabel(e))),
                ))
            .toList(),
        onChanged: (Language? newLang) {
          provider.setLanguage(newLang!);
          SnackBar snackBar = SnackBar(
            duration: const Duration(seconds: 3),
            content: Text(Lang.getNeedsRestart(newLang)),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
  }
}
