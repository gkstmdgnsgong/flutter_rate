import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:flutter_rate/features/book/data/datasources/book_local_datasource.dart';

class BookRemoteDataSource {
  Future<List<Book>> fetchBooks(String query) async {
    final url = Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=$query',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final items = jsonMap['items'] as List<dynamic>?;

      if (items == null) return [];

      return items.map((item) {
        final volumeInfo = item['volumeInfo'] ?? {};
        return Book(
          id: item['id'] ?? '',
          title: volumeInfo['title'] ?? '제목 없음',
          authors:
              (volumeInfo['authors'] as List<dynamic>?)?.join(', ') ?? '저자 미상',
          thumbnailUrl: volumeInfo['imageLinks']?['thumbnail'] ?? '',
        );
      }).toList();
    } else {
      throw Exception('Failed to load books from Google Books API');
    }
  }
}
