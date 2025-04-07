// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/book/domain/entities/book.dart';
import 'features/book/presentation/pages/book_list_page.dart';
import 'features/book/presentation/pages/login_page.dart';
import 'features/book/presentation/pages/rate_book_page.dart';

void main() {
  runApp(const ProviderScope(child: bookApp()));
}

class bookApp extends StatelessWidget {
  const bookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'book Rating App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/books': (context) => const BookListPage(),
        '/rate': (context) {
          final book = ModalRoute.of(context)!.settings.arguments as Book;
          return RateBookPage(book: book);
        },
      },
    );
  }
}
