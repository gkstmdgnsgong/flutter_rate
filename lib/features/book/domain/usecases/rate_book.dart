import '../repositories/book_repository.dart';
import '../entities/book.dart';

class RateBook {
  final BookRepository repository;

  RateBook(this.repository);

  Future<void> call(Book book) {
    return repository.rateBook(book);
  }
}
