import 'package:hive_flutter/hive_flutter.dart';

part 'category_adapter.g.dart';

@HiveType(typeId: 2)
class CategoryDB {
  @HiveField(0)
  dynamic name;
  @HiveField(1)
  String slug;


  CategoryDB({
    required this.name,
    required this.slug,

  });

  factory CategoryDB.fromJson(Map<String, dynamic> json) {
    return CategoryDB(
      name: json['name'],
      slug: json['slug'],
     
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}
