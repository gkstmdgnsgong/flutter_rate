// lib/presentation/pages/book_list_page.dart
// TODO: 영화 목록 UI 구현
import 'package:flutter/material.dart';
import 'package:flutter_rate/features/book/presentation/widgets/book_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/features/book/presentation/viewmodels/book_viewmodel.dart';

class bookListPage extends ConsumerWidget {
  const bookListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("책 목록"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return bookCardWidget(
            book: book,
            onTap: () {
              Navigator.pushNamed(context, '/rate', arguments: book);
            },
          );
        },
      ),
    );
  }
}
