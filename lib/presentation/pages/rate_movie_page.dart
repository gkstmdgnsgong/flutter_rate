// lib/presentation/pages/rate_movie_page.dart
// TODO: 별점 입력 UI 구현

import 'package:flutter/material.dart';
import 'package:flutter_rate/domain/entities/movie.dart';
import 'package:flutter_rate/presentation/widgets/star_rating_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/presentation/viewmodels/movie_viewmodel.dart';

class RateMoviePage extends ConsumerStatefulWidget {
  final Movie movie;
  const RateMoviePage({super.key, required this.movie});

  @override
  ConsumerState<RateMoviePage> createState() => _RateMoviePageState();
}

class _RateMoviePageState extends ConsumerState<RateMoviePage> {
  void initState() {
    super.initState();
    _currentRating = widget.movie.rating ?? 0;
  }

  int _currentRating = 0;

  void _submitRating() {
    if (_currentRating == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("별점을 선택해주세요.")));
      return;
    }
    // TODO: 실제 저장 로직 (UseCase 호출 등)
    ref
        .read(movieListProvider.notifier)
        .rateMovie(widget.movie.id, _currentRating);
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

          Center(
            child: StarRatingWidget(
              rating: _currentRating,
              size: 32,
              onRatingSelected:
                  (rating) => setState(() => _currentRating = rating),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _submitRating, child: const Text("별점 저장")),
        ],
      ),
    );
  }
}
