import 'package:flutter/material.dart';
import 'package:todo_list/lang/lang.dart';
import 'package:todo_list/widgets/settings_screen/settings_color_dropdown.dart';
import 'package:todo_list/widgets/settings_screen/settings_labeled_field.dart';
import 'package:todo_list/widgets/settings_screen/settings_language_dropdown.dart';
import 'package:todo_list/widgets/settings_screen/settings_view_style_dropdown.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widgetSize = MediaQuery.of(context).size.width * 0.7 - 40;
    return Scaffold(
      appBar: AppBar(title: Text(Lang.settings)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SettingsLabeledField(
              label: Lang.color,
              widget: SettingsColorDropdown(width: widgetSize)),
          SettingsLabeledField(
              label: Lang.lang,
              widget: SettingsLanguageDropdown(width: widgetSize)),
          SettingsLabeledField(
              label: Lang.viewType,
              widget: SettingsViewStyleDropdown(width: widgetSize)),
        ]),
      ),
    );
  }
}
