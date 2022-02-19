import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/themes/app_theme.dart';

class TextFieldTaskDialog extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final int? maxLines;
  final int? minLines;
  const TextFieldTaskDialog(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.minLines,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return TextField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: AppTheme.getColor(settingsProvider.appColor)),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: AppTheme.getColor(settingsProvider.appColor)),
                borderRadius: BorderRadius.circular(5))));
  }
}
