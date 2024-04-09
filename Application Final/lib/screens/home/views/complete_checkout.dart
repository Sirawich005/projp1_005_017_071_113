import 'package:flutter/material.dart';
import 'package:book_repository/book_repository.dart'; 
import 'library_page.dart';

class CheckoutCompletePage extends StatelessWidget {
  final String imageUrl;
  final Book book; 
  const CheckoutCompletePage({Key? key, required this.imageUrl, required this.book}) // Add book to constructor
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Complete'),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/correct.png',
              scale: 7,
            ),
            const SizedBox(height: 20),
            const Text(
              'Checkout completed successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              // Navigate to the library page when the button is pressed
              Navigator.of(context).push(
             MaterialPageRoute(
          builder: (context) => LibraryPage(checkedOutBooks: [book]), // Pass the checked-out book
          ),
          );
          },
            child: Text('Go to Library'), // Add your button text here
          ),
          ],
          ),
        ),
      );
  }
}
