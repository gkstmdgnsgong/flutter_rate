// lib/presentation/widgets/star_rating_widget.dart
// TODO: 재사용 가능한 별점 위젯 구현

import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final int rating;
  final double size;
  final ValueChanged<int>? onRatingSelected;

  const StarRatingWidget({
    super.key,
    required this.rating,
    this.size = 20,
    this.onRatingSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        return GestureDetector(
          onTap:
              onRatingSelected != null ? () => onRatingSelected!(i + 1) : null,
          child: Icon(
            i < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: size,
          ),
        );
      }),
    );
  }
}
