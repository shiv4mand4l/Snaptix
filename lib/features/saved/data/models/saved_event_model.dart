// import 'package:equatable/equatable.dart';

// class SavedEventModel extends Equatable {
//   final String id;
//   final String title;
//   final String category;
//   final String imageUrl;
//   final String dates;
//   final String time;
//   final String location;
//   final double price;
//   final bool isTrending;
//   final bool isSaved;
//   final int attendeesCount;
//   const SavedEventModel({
//     required this.id,
//     required this.title,
//     required this.category,
//     required this.imageUrl,
//     required this.dates,
//     required this.time,
//     required this.location,
//     required this.price,
//     required this.isTrending,
//     required this.isSaved,
//     required this.attendeesCount,
//   });
//   SavedEventModel copyWith({
//     String? id,
//     String? title,
//     String? category,
//     String? imageUrl,
//     String? dates,
//     String? time,
//     String? location,
//     double? price,
//     bool? isTrending,
//     bool? isSaved,
//     int? attendeesCount,
//   }) {
//     return SavedEventModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       category: category ?? this.category,
//       imageUrl: imageUrl ?? this.imageUrl,
//       dates: dates ?? this.dates,
//       time: time ?? this.time,
//       location: location ?? this.location,
//       price: price ?? this.price,
//       isTrending: isTrending ?? this.isTrending,
//       isSaved: isSaved ?? this.isSaved,
//       attendeesCount: attendeesCount ?? this.attendeesCount,
//     );
//   }

//   @override
//   List<Object?> get props => [
//     id,
//     title,
//     category,
//     imageUrl,
//     dates,
//     time,
//     location,
//     price,
//     isTrending,
//   ];
// }

// import 'package:flutter_task/features/saved/domain/entities/saved_event_entities.dart';

// class SavedEventModel extends SavedEventEntities {
//   const SavedEventModel({
//     required super.id,
//     required super.title,
//     required super.category,
//     required super.isSaved,
//   });

//   SavedEventModel copyWith({bool? isSaved}) {
//     return SavedEventModel(
//       id: id,
//       title: title,
//       category: category,
//       isSaved: isSaved ?? this.isSaved,
//     );
//   }
// }

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
