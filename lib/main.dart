// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/movie_list_page.dart';
import 'presentation/pages/rate_movie_page.dart';
import 'domain/entities/movie.dart';

void main() {
  runApp(const ProviderScope(child: MovieApp()));
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Rating App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/movies': (context) => const MovieListPage(),
        '/rate': (context) {
          final movie = ModalRoute.of(context)!.settings.arguments as Movie;
          return RateMoviePage(movie: movie);
        },
      },
    );
  }
}
