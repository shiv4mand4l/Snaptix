import '../../domain/entities/nearby_event_entities.dart';

class NearbyEventModel extends NearbyEventEntity {
  const NearbyEventModel({
    required super.id,
    required super.title,
    required super.category,
    required super.date,
    required super.time,
    required super.location,
    required super.price,
    required super.imageUrl,
    super.isFavourite,
  });

  factory NearbyEventModel.fromJson(Map<String, dynamic> json) {
    return NearbyEventModel(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      location: json['location'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      isFavourite: json['isFavourite'] as bool? ?? false,
    );
  }
}
