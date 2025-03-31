import 'package:flutter_rate/domain/entities/movie.dart';
import 'package:flutter_rate/domain/repositories/movie_repository.dart';
import 'package:flutter_rate/data/datasources/movie_local_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieLocalDataSource localDataSource;

  MovieRepositoryImpl(this.localDataSource);

  @override
  Future<List<Movie>> getMovies() async {
    return await localDataSource.loadMovies();
  }

  @override
  Future<void> rateMovie(String movieId, int rating) async {
    return await localDataSource.saveRating(movieId, rating);
  }
}
