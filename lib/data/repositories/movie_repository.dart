// lib/data/repositories/movie_repository_impl.dart
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_local_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieLocalDataSource localDataSource;
  MovieRepositoryImpl(this.localDataSource);

  @override
  Future<List<Movie>> getMovies() => localDataSource.loadMovies();

  @override
  Future<void> rateMovie(String movieId, int rating) =>
      localDataSource.saveRating(movieId, rating);
}
