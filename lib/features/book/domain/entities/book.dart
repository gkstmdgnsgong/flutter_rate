// lib/features/book/domain/entities/book.dart
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

  Book copyWith({int? rating}) => Book(
    id: id,
    title: title,
    authors: authors,
    thumbnailUrl: thumbnailUrl,
    rating: rating ?? this.rating,
  );

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json['id'] ?? '',
    title: json['title'] ?? '',
    authors: json['authors'] ?? '저자 미상',
    thumbnailUrl: json['thumbnailUrl'] ?? '',
    rating: json['rating'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'authors': authors,
    'thumbnailUrl': thumbnailUrl,
    'rating': rating,
  };
}
