// lib/presentation/pages/movie_list_page.dart
// TODO: 영화 목록 UI 구현
import 'package:flutter/material.dart';
import 'package:flutter_rate/domain/entities/movie.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  // 더미 데이터 (임시)
  final List<Movie> dummyMovies = const [
    Movie(id: '1', title: 'Interstellar'),
    Movie(id: '2', title: 'Inception'),
    Movie(id: '3', title: 'The Matrix'),
  ];

  @override
  Widget build(BuildContext context) {
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
        itemCount: dummyMovies.length,
        itemBuilder: (context, index) {
          final movie = dummyMovies[index];
          return ListTile(
            title: Text(movie.title),
            trailing:
                movie.rating != null
                    ? Text(
                      "${movie.rating}/5",
                      style: const TextStyle(fontSize: 16),
                    )
                    : null,
            onTap: () {
              // TODO: 별점 입력 화면으로 이동
              Navigator.pushNamed(context, '/rate', arguments: movie);
            },
          );
        },
      ),
    );
  }
}
