// lib/presentation/widgets/book_card_widget.dart
import 'package:flutter/material.dart';
import '../../domain/entities/book.dart';
import 'star_rating_widget.dart';

class bookCardWidget extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const bookCardWidget({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 포스터를 대신하는 임시 배경
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              StarRatingWidget(rating: book.rating ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}
