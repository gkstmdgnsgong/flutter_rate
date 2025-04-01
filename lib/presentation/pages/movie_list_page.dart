// lib/presentation/pages/movie_list_page.dart
// TODO: 영화 목록 UI 구현
import 'package:flutter/material.dart';
import 'package:flutter_rate/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/presentation/viewmodels/movie_viewmodel.dart';

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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (i) {
                return Icon(
                  i < (movie.rating ?? 0) ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/rate', arguments: movie);
            },
          );
        },
      ),
    );
  }
}
