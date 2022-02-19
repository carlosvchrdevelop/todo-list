import 'package:hive/hive.dart';

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
