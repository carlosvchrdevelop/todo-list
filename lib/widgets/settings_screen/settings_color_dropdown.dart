import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/settings_provider.dart';
import 'package:todo_list/themes/app_theme.dart';

class SettingsColorDropdown extends StatelessWidget {
  final double width;
  const SettingsColorDropdown({Key? key, required this.width})
      : super(key: key);

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
                  child: SizedBox(
                    height: 32,
                    width: width,
                  ),
                )))
            .toList(),
        onChanged: (String? newColor) {
          provider.setAppColor(newColor!);
        });
  }
}
