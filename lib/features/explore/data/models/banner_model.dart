import '../../domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.title,
    required super.description,
    required super.buttonText,
  });

  /// Factory constructor to create a BannerModel from JSON
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      buttonText: json['button_text'] ?? 'Create Event',
    );
  }

  /// Converts BannerModel instance to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'button_text': buttonText,
    };
  }
}
