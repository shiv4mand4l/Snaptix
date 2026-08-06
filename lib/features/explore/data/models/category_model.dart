// data/models/category_model.dart
import '../../domain/entities/category_entities.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.iconName,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      iconName: json['icon_name'] ?? '',
    );
  }
}
