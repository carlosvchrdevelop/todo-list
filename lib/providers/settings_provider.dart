import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/lang/lang.dart';
import 'package:todo_list/lang/language.dart';
import 'package:todo_list/model/box_manager.dart';
import 'package:todo_list/src/view_type.dart';
import 'package:todo_list/themes/app_theme.dart';

class SettingsProvider extends ChangeNotifier {
  late String appColor;
  late Language language;
  late ViewType viewType;

  Future<void> initizalizeValues() async {
    Box<dynamic> box = Hive.box(BoxManager.settingBox);
    appColor = await box.get('appColor') ?? AppTheme.blue;
    language = await box.get('language') ?? Language.english;
    viewType = await box.get('viewType') ?? ViewType.regular;
    Lang.language = language;
    AppTheme.primary = AppTheme.getColor(appColor);
  }

  Future<void> setAppColor(String appColor) async {
    Box<dynamic> box = Hive.box(BoxManager.settingBox);
    await box.put('appColor', appColor);
    this.appColor = appColor;
    notifyListeners();
  }

  Future<void> setLanguage(Language language) async {
    Box<dynamic> box = Hive.box(BoxManager.settingBox);
    await box.put('language', language);
    this.language = language;
    notifyListeners();
  }

  Future<void> setViewType(ViewType viewType) async {
    Box<dynamic> box = Hive.box(BoxManager.settingBox);
    await box.put('viewType', viewType);
    this.viewType = viewType;
    notifyListeners();
  }
}
