import 'package:hive/hive.dart';
import 'package:todo_list/lang/lang.dart';

part 'view_type.g.dart';

@HiveType(typeId: 4)
enum ViewType {
  @HiveField(0)
  regular,

  @HiveField(1)
  compact,

  @HiveField(2)
  comfortable
}

class ViewTypeManager {
  static List<ViewType> getViewTypes() {
    return [ViewType.regular, ViewType.compact, ViewType.comfortable];
  }

  static const double _compactSize = 0;
  static const double _comfortableSize = 12;
  static const double _regularSize = 8;

  static getViewTypeSize(ViewType viewType) {
    switch (viewType) {
      case ViewType.comfortable:
        return _comfortableSize;
      case ViewType.compact:
        return _compactSize;
      default:
        return _regularSize;
    }
  }

  static String getViewTypeLabel(ViewType viewType) {
    switch (viewType) {
      case ViewType.compact:
        return Lang.viewTypeCompact;
      case ViewType.comfortable:
        return Lang.viewTypeComfortable;
      default:
        return Lang.viewTypeRegular;
    }
  }
}
