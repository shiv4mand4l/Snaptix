// domain/entities/category_entity.dart
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String title;
  final String iconName;

  const CategoryEntity({
    required this.id,
    required this.title,
    required this.iconName,
  });

  @override
  List<Object> get props => [id, title, iconName];
}
