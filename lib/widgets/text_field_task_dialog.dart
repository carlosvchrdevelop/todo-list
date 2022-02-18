import 'package:flutter/material.dart';
import 'package:todo_list/themes/AppTheme.dart';

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
    return TextField(
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: AppTheme.primary),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: AppTheme.primary),
                borderRadius: BorderRadius.circular(15))));
  }
}
