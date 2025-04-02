// lib/data/datasources/movie_local_datasource.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../domain/entities/movie.dart';

class MovieLocalDataSource {
  Future<List<Movie>> loadMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final ratingsJson = prefs.getString('ratings');
    final ratings =
        ratingsJson != null
            ? Map<String, dynamic>.from(json.decode(ratingsJson))
            : {};

    return [
      const Movie(id: '1', title: 'Interstellar'),
      const Movie(id: '2', title: 'Inception'),
      const Movie(id: '3', title: 'The Matrix'),
    ].map((movie) {
      final rating = ratings[movie.id];
      return movie.copyWith(rating: rating);
    }).toList();
  }

  Future<void> saveRating(String movieId, int rating) async {
    final prefs = await SharedPreferences.getInstance();
    final ratingsJson = prefs.getString('ratings');
    final ratings =
        ratingsJson != null
            ? Map<String, dynamic>.from(json.decode(ratingsJson))
            : {};
    ratings[movieId] = rating;
    await prefs.setString('ratings', json.encode(ratings));
  }
}
