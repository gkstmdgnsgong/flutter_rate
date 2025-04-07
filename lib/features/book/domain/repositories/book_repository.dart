import 'package:flutter_rate/features/book/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<void> rateBook(Book book);
  Future<List<Book>> fetchBooks(String query);
}
