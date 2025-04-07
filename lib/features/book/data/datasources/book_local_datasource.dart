// lib/data/datasources/book_local_datasource.dart
import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BookLocalDataSource {
  Future<List<Book>> loadBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final ratingsJson = prefs.getString('ratings');
    final ratings =
        ratingsJson != null
            ? Map<String, dynamic>.from(json.decode(ratingsJson))
            : {};

    return [
      const Book(
        id: '1',
        title: 'Interstellar',
        authors: 'Christopher Nolan',
        thumbnailUrl: '',
      ),
      const Book(
        id: '2',
        title: 'Inception',
        authors: 'Christopher Nolan',
        thumbnailUrl: '',
      ),
      const Book(
        id: '3',
        title: 'The Matrix',
        authors: 'Lana Wachowski, Lilly Wachowski',
        thumbnailUrl: '',
      ),
    ].map((book) {
      final rating = ratings[book.id];
      return book.copyWith(rating: rating);
    }).toList();
  }

  Future<void> saveRating(String bookId, int rating) async {
    final prefs = await SharedPreferences.getInstance();
    final ratingsJson = prefs.getString('ratings');
    final ratings =
        ratingsJson != null
            ? Map<String, dynamic>.from(json.decode(ratingsJson))
            : {};
    ratings[bookId] = rating;
    await prefs.setString('ratings', json.encode(ratings));
  }
}
