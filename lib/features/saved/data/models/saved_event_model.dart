import '../../domain/entities/saved_event_entities.dart';

class SavedEventModel extends SavedEventEntity {
  const SavedEventModel({
    required super.id,
    required super.title,
    required super.category,
    required super.imageUrl,
    required super.dates,
    required super.time,
    required super.location,
    required super.price,
    required super.isTrending,
    required super.isSaved,
    required super.attendeesCount,
  });

  factory SavedEventModel.fromJson(Map<String, dynamic> json) {
    return SavedEventModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      dates: json['dates'],
      time: json['time'],
      location: json['location'],
      price: (json['price'] as num).toDouble(),
      isTrending: json['isTrending'],
      isSaved: json['isSaved'],
      attendeesCount: json['attendeesCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'imageUrl': imageUrl,
      'dates': dates,
      'time': time,
      'location': location,
      'price': price,
      'isTrending': isTrending,
      'isSaved': isSaved,
      'attendeesCount': attendeesCount,
    };
  }

  @override
  SavedEventModel copyWith({
    String? id,
    String? title,
    String? category,
    String? imageUrl,
    String? dates,
    String? time,
    String? location,
    double? price,
    bool? isTrending,
    bool? isSaved,
    int? attendeesCount,
  }) {
    return SavedEventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      dates: dates ?? this.dates,
      time: time ?? this.time,
      location: location ?? this.location,
      price: price ?? this.price,
      isTrending: isTrending ?? this.isTrending,
      isSaved: isSaved ?? this.isSaved,
      attendeesCount: attendeesCount ?? this.attendeesCount,
    );
  }
}
