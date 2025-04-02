// lib/data/repositories/movie_repository_impl.dart
// lib/domain/repositories/movie_repository.dart
import 'package:flutter_rate/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
  Future<void> rateMovie(String movieId, int rating);
}
