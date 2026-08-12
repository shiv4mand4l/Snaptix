// data/models/event_model.dart
import '../../domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel({
    required super.id,
    required super.title,
    required super.category,
    required super.date,
    required super.time,
    required super.location,
    required super.price,
    required super.imageUrl,
    super.isFavourite,
    super.isTrending,
    required super.catagoryId,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      title: json['title'],
      category: json['category'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] ?? '',
      isFavourite: json['is_favourite'] ?? false,
      isTrending: json['is_trending'] ?? false,
      catagoryId: json['catagoryId'] as int,
    );
  }
}
