// lib/data/models/book_model.dart
import 'package:flutter_rate/features/book/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.authors,
    required super.thumbnailUrl,
    super.rating,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      authors: (json['authors'] as List<dynamic>?)?.join(', ') ?? '저자 미상',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      rating: json['rating'], // null 일 수도 있음
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'thumbnailUrl': thumbnailUrl,
      'rating': rating,
    };
  }
}
