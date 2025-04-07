// lib/presentation/viewmodels/book_viewmodel.dart
// TODO: 상태관리 ViewModel 구현

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/features/book/domain/entities/book.dart';

final bookListProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  return BookNotifier();
});

class BookNotifier extends StateNotifier<List<Book>> {
  BookNotifier()
    : super([
        const Book(
          id: '1',
          title: 'Interstellar',
          authors: 'Christopher Nolan',
          thumbnailUrl: '', // 임시로 비워둬도 OK
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
      ]);

  void ratebook(String bookId, int rating) {
    state = [
      for (final book in state)
        if (book.id == bookId) book.copyWith(rating: rating) else book,
    ];
  }
}
