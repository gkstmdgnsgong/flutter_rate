// lib/features/book/data/repositories/book_repository_impl.dart
import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:flutter_rate/features/book/domain/repositories/book_repository.dart';
import 'package:flutter_rate/features/book/data/datasources/book_local_datasource.dart';

class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource localDataSource;
  BookRepositoryImpl(this.localDataSource);

  @override
  Future<List<Book>> getBooks() => localDataSource.loadBooks();

  @override
  Future<void> rateBook(String bookId, int rating) =>
      localDataSource.saveRating(bookId, rating);
}
