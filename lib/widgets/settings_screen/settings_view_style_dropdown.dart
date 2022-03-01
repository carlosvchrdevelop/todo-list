import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/src/view_type.dart';

class SettingsViewStyleDropdown extends StatelessWidget {
  final double width;
  const SettingsViewStyleDropdown({Key? key, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return DropdownButton<ViewType>(
        value: provider.viewType,
        items: ViewTypeManager.getViewTypes()
            .map((e) => DropdownMenuItem(
                value: e,
                child: SizedBox(
                    width: width,
                    child: Text(ViewTypeManager.getViewTypeLabel(e)))))
            .toList(),
        onChanged: (ViewType? newValue) {
          provider.setViewType(newValue!);
        });
  }
}
