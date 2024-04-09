
import 'package:book_repository/src/entities/macros_entity.dart';

class Macros{
  int horror;
  int fun;
  int romance;
  int score;

  Macros({
    required this.fun,
    required this.horror,
    required this.romance,
    required this.score
  });

  MacrosEntity toEntity() {
    return MacrosEntity(
      horror: horror,
      fun: fun,
      romance: romance,
      score: score,
    );
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
      horror: entity.horror,
      fun: entity.fun,
      romance: entity.romance,
      score: entity.score,
    );
  }
}

