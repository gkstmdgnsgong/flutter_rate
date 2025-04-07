// lib/presentation/pages/rate_book_page.dart
// TODO: 별점 입력 UI 구현

import 'package:flutter/material.dart';
import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:flutter_rate/features/book/presentation/widgets/star_rating_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/features/book/presentation/viewmodels/book_viewmodel.dart';

class RatebookPage extends ConsumerStatefulWidget {
  final Book book;
  const RatebookPage({super.key, required this.book});

  @override
  ConsumerState<RatebookPage> createState() => _RatebookPageState();
}

class _RatebookPageState extends ConsumerState<RatebookPage> {
  void initState() {
    super.initState();
    _currentRating = widget.book.rating ?? 0;
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
        .read(bookListProvider.notifier)
        .ratebook(widget.book.id, _currentRating);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
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
