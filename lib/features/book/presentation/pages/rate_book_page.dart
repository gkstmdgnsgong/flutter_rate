// lib/features/book/presentation/pages/rate_book_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:flutter_rate/features/book/presentation/viewmodels/book_viewmodel.dart';
import 'package:flutter_rate/features/book/presentation/widgets/star_rating_widget.dart';

class RateBookPage extends ConsumerStatefulWidget {
  final Book book;

  const RateBookPage({super.key, required this.book});

  @override
  ConsumerState<RateBookPage> createState() => _RateBookPageState();
}

class _RateBookPageState extends ConsumerState<RateBookPage> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.book.rating ?? 0;
  }

  void _submitRating() {
    if (_currentRating == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("별점을 선택해주세요.")));
      return;
    }
    final ratedBook = widget.book.copyWith(rating: _currentRating);

    ref.read(bookListProvider.notifier).rateBook(ratedBook);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("별점 평가")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.book.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
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
            ElevatedButton(
              onPressed: _submitRating,
              child: const Text("별점 저장"),
            ),
          ],
        ),
      ),
    );
  }
}
