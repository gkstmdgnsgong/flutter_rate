import 'package:flutter_rate/domain/entities/movie.dart';

class MovieLocalDataSource {
  Future<List<Movie>> loadMovies() async {
    // 더미 데이터 리턴
    return [
      Movie(id: '1', title: 'Interstellar'),
      Movie(id: '2', title: 'Inception'),
    ];
  }

  Future<void> saveRating(String movieId, int rating) async {
    // SharedPreferences 등에 저장하는 코드 작성
  }
}
