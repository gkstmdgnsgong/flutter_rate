// lib/features/book/data/repositories/book_repository_impl.dart
import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:flutter_rate/features/book/domain/repositories/book_repository.dart';
import 'package:flutter_rate/features/book/data/datasources/book_local_datasource.dart';
import 'package:flutter_rate/features/book/data/datasources/book_remote_datasource.dart';

class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource localDataSource;
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<List<Book>> getBooks() => localDataSource.loadBooks();

  @override
  Future<void> rateBook(Book book) => localDataSource.saveBook(book);

  @override
  Future<List<Book>> fetchBooks(String query) =>
      remoteDataSource.fetchBooks(query);
}
