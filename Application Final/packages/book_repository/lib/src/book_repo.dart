import 'models/models.dart';

abstract class BookRepo{
    Future<List<Book>> getBooks();
    Future<List<Book>> getAdventureBooks();
    Future<List<Book>> getFinancialBooks();

}