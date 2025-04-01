// lib/presentation/pages/rate_movie_page.dart
// TODO: 별점 입력 UI 구현

import 'package:flutter/material.dart';
import 'package:flutter_rate/domain/entities/movie.dart';

class RateMoviePage extends StatefulWidget {
  final Movie movie;
  const RateMoviePage({super.key, required this.movie});

  @override
  State<RateMoviePage> createState() => _RateMoviePageState();
}

class _RateMoviePageState extends State<RateMoviePage> {
  int _currentRating = 0;

  void _submitRating() {
    if (_currentRating == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("별점을 선택해주세요.")));
      return;
    }
    // TODO: 실제 저장 로직 (UseCase 호출 등)
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("별점을 선택해주세요", style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return IconButton(
                icon: Icon(
                  _currentRating >= starIndex ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 32,
                ),
                onPressed: () {
                  setState(() {
                    _currentRating = starIndex;
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _submitRating, child: const Text("별점 저장")),
        ],
      ),
    );
  }
}
