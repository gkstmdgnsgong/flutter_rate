class Movie {
  final String id;
  final String title;
  final int? rating;

  const Movie({required this.id, required this.title, this.rating});

  Movie copyWith({int? rating}) => Movie(id: id, title: title, rating: rating);
}
