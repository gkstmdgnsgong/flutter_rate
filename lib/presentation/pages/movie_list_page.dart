// lib/presentation/pages/movie_list_page.dart
// TODO: 영화 목록 UI 구현
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/presentation/viewmodels/movie_viewmodel.dart';
import 'package:flutter_rate/presentation/widgets/star_rating_widget.dart';

class MovieListPage extends ConsumerWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(movieListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("영화 목록"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: Text(movie.title),
            trailing: StarRatingWidget(rating: movie.rating ?? 0),
            onTap: () {
              Navigator.pushNamed(context, '/rate', arguments: movie);
            },
          );
        },
      ),
    );
  }
}
