import 'package:flutter_rate/features/book/domain/entities/book.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BookLocalDataSource {
  static const _storageKey = 'rated_books';

  Future<List<Book>> loadBooks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) return [];

    final List<dynamic> decoded = json.decode(jsonString);
    return decoded.map((item) => Book.fromJson(item)).toList();
  }

  Future<void> saveBook(Book book) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);
    List<dynamic> existing = jsonString != null ? json.decode(jsonString) : [];

    // 같은 ID 책이 있으면 덮어쓰기
    existing.removeWhere((item) => item['id'] == book.id);
    existing.add(book.toJson());

    await prefs.setString(_storageKey, json.encode(existing));
  }
}
