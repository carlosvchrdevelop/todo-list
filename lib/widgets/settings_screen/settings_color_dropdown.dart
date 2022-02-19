import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/themes/app_theme.dart';

class SettingsColorDropdown extends StatelessWidget {
  const SettingsColorDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return DropdownButton<String>(
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
        });
  }
}
