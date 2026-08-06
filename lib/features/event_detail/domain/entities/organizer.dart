class Organizer {
  final String id;
  final String name;
  final String logoUrl;
  final double rating;
  final String reviewsCount;
  final bool isFollowing;

  const Organizer({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.rating,
    required this.reviewsCount,
    required this.isFollowing,
  });

  Organizer copyWith({
    String? id,
    String? name,
    String? logoUrl,
    double? rating,
    String? reviewsCount,
    bool? isFollowing,
  }) {
    return Organizer(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }
}
