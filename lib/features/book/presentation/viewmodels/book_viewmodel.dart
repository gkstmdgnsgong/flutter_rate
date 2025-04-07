// lib/features/book/presentation/viewmodels/book_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:flutter_rate/features/book/data/datasources/book_remote_datasource.dart';
import 'package:flutter_rate/features/book/data/datasources/book_local_datasource.dart';

final bookListProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  return BookNotifier(BookRemoteDataSource(), BookLocalDataSource());
});

class BookNotifier extends StateNotifier<List<Book>> {
  final BookRemoteDataSource remoteDataSource;
  final BookLocalDataSource localDataSource;

  BookNotifier(this.remoteDataSource, this.localDataSource) : super([]);

  Future<void> loadBooks() async {
    final books = await localDataSource.loadBooks();
    state = books;
  }

  Future<void> fetchBooks(String query) async {
    try {
      final books = await remoteDataSource.fetchBooks(query);
      final ratedBooks = await localDataSource.loadBooks();
      final ratedMap = {for (var b in ratedBooks) b.id: b.rating};

      state = books.map((b) => b.copyWith(rating: ratedMap[b.id])).toList();
    } catch (e) {
      state = [];
    }
  }

  void rateBook(Book book) {
    state = [
      for (final b in state)
        if (b.id == book.id) book else b,
    ];
    localDataSource.saveBook(book);
  }
}
