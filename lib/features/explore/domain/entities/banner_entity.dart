// domain/entities/banner_entity.dart
import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String buttonText;

  const BannerEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.buttonText,
  });

  @override
  List<Object> get props => [id, title, description, buttonText];
}
