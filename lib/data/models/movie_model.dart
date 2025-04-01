// lib/data/models/movie_model.dart
import 'package:flutter_rate/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({required super.id, required super.title, super.rating});
  // TODO: toJson/fromJson 등 직렬화 구현
}
