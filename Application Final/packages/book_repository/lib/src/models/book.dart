
import 'package:book_repository/book_repository.dart';

class Book{
  String bookId;
  String picture;
  bool isFinance;
  bool isAdventure;
  String name;
  String description;
  int price;
  int discount;
  String story;
  Macros macros;

  Book({
    required this.bookId,
    required this.picture,
    required this.isFinance,
    required this.isAdventure,
    required this.description,
    required this.name,
    required this.discount,
    required this.macros,
    required this.story,
    required this.price,
    });
  
  BookEntity toEntity() {
    return BookEntity(
      bookId: bookId,
      picture: picture,
      isFinance: isFinance,
      isAdventure: isAdventure,
      name: name,
      description: description,
      price: price,
      discount: discount,
      story: story,
      macros: macros,
    );
  }

  static Book fromEntity(BookEntity entity) {
    return Book(
      bookId: entity.bookId,
      picture: entity.picture,
      isFinance: entity.isFinance,
      isAdventure: entity.isAdventure,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      story: entity.story,
      macros: entity.macros,
    );
  }
}
