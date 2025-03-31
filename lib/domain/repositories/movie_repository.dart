import 'package:flutter_rate/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
  Future<void> rateMovie(String movieId, int rating);
}
