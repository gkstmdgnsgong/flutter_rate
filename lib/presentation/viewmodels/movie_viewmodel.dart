// lib/presentation/viewmodels/movie_viewmodel.dart
// TODO: 상태관리 ViewModel 구현

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/domain/entities/movie.dart';

final movieListProvider = StateNotifierProvider<MovieNotifier, List<Movie>>((
  ref,
) {
  return MovieNotifier();
});

class MovieNotifier extends StateNotifier<List<Movie>> {
  MovieNotifier()
    : super([
        const Movie(id: '1', title: 'Interstellar'),
        const Movie(id: '2', title: 'Inception'),
        const Movie(id: '3', title: 'The Matrix'),
      ]);

  void rateMovie(String movieId, int rating) {
    state = [
      for (final movie in state)
        if (movie.id == movieId) movie.copyWith(rating: rating) else movie,
    ];
  }
}
