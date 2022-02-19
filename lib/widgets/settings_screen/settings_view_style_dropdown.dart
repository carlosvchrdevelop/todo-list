import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/src/view_type.dart';

class SettingsViewStyleDropdown extends StatelessWidget {
  const SettingsViewStyleDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return DropdownButton<ViewType>(
        value: provider.viewType,
        items: ViewTypeManager.getViewTypes()
            .map((e) => DropdownMenuItem(
                value: e, child: Text(ViewTypeManager.getViewTypeLabel(e))))
            .toList(),
        onChanged: (ViewType? newValue) {
          provider.setViewType(newValue!);
        });
  }
}
