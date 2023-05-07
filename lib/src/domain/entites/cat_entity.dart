import 'package:hive_flutter/hive_flutter.dart';

part 'cat_entity.g.dart';

@HiveType(typeId: 0)
class CatEntity extends HiveObject {
  @HiveField(0)
  List<DataEntity>? data;
  @HiveField(1)
  List<LinksEntity>? links;
  @HiveField(2)
  int? total;
}

@HiveType(typeId: 1)
class DataEntity extends HiveObject {
  @HiveField(0)
  String? breed;
  @HiveField(1)
  String? country;
  @HiveField(2)
  String? origin;
  @HiveField(3)
  String? coat;
  @HiveField(4)
  String? pattern;
}

@HiveType(typeId: 2)
class LinksEntity extends HiveObject {
  @HiveField(0)
  String? url;
  @HiveField(1)
  String? label;
  @HiveField(2)
  bool? active;
}
