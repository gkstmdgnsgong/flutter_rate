// lib/features/book/presentation/pages/book_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rate/features/book/presentation/pages/rate_book_page.dart';
import 'package:flutter_rate/features/book/presentation/viewmodels/book_viewmodel.dart';
import 'package:flutter_rate/features/book/presentation/widgets/book_card_widget.dart';

class BookListPage extends ConsumerStatefulWidget {
  const BookListPage({super.key});

  @override
  ConsumerState<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends ConsumerState<BookListPage> {
  final _controller = TextEditingController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookListProvider.notifier).loadBooks();
    });
  }

  void _searchBooks() {
    final query = _controller.text.trim();
    if (query.isNotEmpty) {
      ref.read(bookListProvider.notifier).fetchBooks(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(bookListProvider);

    final searchBooks = books;
    final ratedBooks = books.where((book) => book.rating != null).toList();

    final tabs = [_buildBookList(searchBooks), _buildBookList(ratedBooks)];

    return Scaffold(
      appBar: AppBar(
        title: const Text('책 검색'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_selectedIndex == 0)
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '책 제목을 입력하세요',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchBooks,
                  ),
                ),
                onSubmitted: (_) => _searchBooks(),
              ),
            const SizedBox(height: 12),
            Expanded(child: tabs[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: '내 서재'),
        ],
      ),
    );
  }

  Widget _buildBookList(List books) {
    if (books.isEmpty) {
      return const Center(child: Text('표시할 책이 없습니다'));
    }
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return BookCardWidget(
          book: book,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => RateBookPage(book: book)),
            );
          },
        );
      },
    );
  }
}
