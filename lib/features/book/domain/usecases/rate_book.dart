import '../repositories/book_repository.dart';

class Ratebook {
  final BookRepository repository;

  Ratebook(this.repository);

  Future<void> call(String bookId, int rating) {
    return repository.rateBook(bookId, rating);
  }
}
