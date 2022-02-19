import 'package:flutter/material.dart';
import 'package:todo_list/lang/lang.dart';

class TaskDialogCancelButton extends StatelessWidget {
  const TaskDialogCancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(Lang.cancel));
  }
}
