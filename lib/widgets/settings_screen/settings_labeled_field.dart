import 'package:flutter/material.dart';

class SettingsLabeledField extends StatelessWidget {
  final Widget widget;
  final String label;
  const SettingsLabeledField(
      {Key? key, required this.widget, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Text(label),
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        Expanded(child: widget)
      ],
    );
  }
}
