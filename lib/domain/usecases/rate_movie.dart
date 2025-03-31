import 'package:flutter_rate/domain/repositories/movie_repository.dart';

class RateMovie {
  final MovieRepository repository;

  RateMovie(this.repository);

  Future<void> call(String movieId, int rating) {
    return repository.rateMovie(movieId, rating);
  }
}
