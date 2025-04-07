class Book {
  final String id;
  final String title;
  final String authors;
  final String thumbnailUrl;
  final int? rating;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnailUrl,
    this.rating,
  });

  Book copyWith({int? rating}) {
    return Book(
      id: id,
      title: title,
      authors: authors,
      thumbnailUrl: thumbnailUrl,
      rating: rating ?? this.rating,
    );
  }
}
