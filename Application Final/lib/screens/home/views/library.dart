import 'package:book_repository/book_repository.dart';

class Library {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> get books => _books;
  
}
