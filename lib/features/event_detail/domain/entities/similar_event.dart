class SimilarEvent {
  final String id;
  final String imageUrl;
  final String category;
  final String title;
  final String dateAndLocation;
  final bool isFavorite;

  const SimilarEvent({
    required this.id,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.dateAndLocation,
    required this.isFavorite,
  });

  SimilarEvent copyWith({
    String? id,
    String? imageUrl,
    String? category,
    String? title,
    String? dateAndLocation,
    bool? isFavorite,
  }) {
    return SimilarEvent(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      title: title ?? this.title,
      dateAndLocation: dateAndLocation ?? this.dateAndLocation,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
