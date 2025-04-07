// lib/data/repositories/book_repository_impl.dart
// lib/domain/repositories/book_repository.dart
import 'package:flutter_rate/features/book/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getbooks();
  Future<void> ratebook(String bookId, int rating);
}
