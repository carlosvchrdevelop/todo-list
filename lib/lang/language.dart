import 'package:hive/hive.dart';

part 'language.g.dart';

@HiveType(typeId: 3)
enum Language {
  @HiveField(0)
  english,

  @HiveField(1)
  spanish
}
