
import 'package:book_repository/book_repository.dart';
import 'package:book_repository/src/entities/macros_entity.dart';

class BookEntity{
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

  BookEntity({
    required this.bookId,
    required this.picture,
    required this.isFinance,
    required this.isAdventure,
    required this.description,
    required this.name,
    required this.discount,
    required this.macros,
    required this.price, 
    required this.story,
});
  Map<String, Object?> toDocument() {
    return {
      'bookId': bookId,
      'picture': picture,
      'isFinance': isFinance,
      'isAdventure': isAdventure,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'story': story,
      'macros': macros.toEntity().toDocument(),
    };
  }

  static BookEntity fromDocument(Map<String, dynamic> doc) {
    return BookEntity(
      bookId: doc['bookId'],
      picture: doc['picture'],
      isFinance: doc['isFinance'],
      isAdventure: doc['isAdventure'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      discount: doc['discount'],
      story: doc['story'],
      macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
}
