import '../../domain/entities/similar_event.dart';

class SimilarEventModel extends SimilarEvent {
  const SimilarEventModel({
    required super.id,
    required super.imageUrl,
    required super.category,
    required super.title,
    required super.dateAndLocation,
    required super.isFavorite,
  });

  factory SimilarEventModel.fromJson(Map<String, dynamic> json) {
    return SimilarEventModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      title: json['title'],
      dateAndLocation: json['dateAndLocation'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'category': category,
      'title': title,
      'dateAndLocation': dateAndLocation,
      'isFavorite': isFavorite,
    };
  }

  factory SimilarEventModel.fromEntity(SimilarEvent event) {
    return SimilarEventModel(
      id: event.id,
      imageUrl: event.imageUrl,
      category: event.category,
      title: event.title,
      dateAndLocation: event.dateAndLocation,
      isFavorite: event.isFavorite,
    );
  }
}
