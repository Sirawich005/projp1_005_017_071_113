import 'package:book_repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home/views/read_book.dart';

class LibraryPage extends StatelessWidget {
  final List<Book> checkedOutBooks;

  const LibraryPage({Key? key, required this.checkedOutBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Library'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: ListView.builder(
        itemCount: checkedOutBooks.length,
        itemBuilder: (context, index) {
          Book book = checkedOutBooks[index];
          return ListTile(
            leading: Image.network(book.picture),
            title: Text(book.name),
            subtitle: Text(book.description),
            onTap: () {
              // Navigate to ReadPage when a book is tapped
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReadPage(book: book),
              ));
            },
          );
        },
      ),
    );
  }
}
