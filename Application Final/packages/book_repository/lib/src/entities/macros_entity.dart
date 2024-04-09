class MacrosEntity{
  int horror;
  int fun;
  int romance;
  int score;

  MacrosEntity({
    required this.fun,
    required this.horror,
    required this.romance,
    required this.score
  });


  Map<String, Object?> toDocument() {
    return {
      'horror': horror,
      'fun': fun,
      'romance': romance,
      'score': score,
    };
  }

  static MacrosEntity fromDocument(Map<String, dynamic> doc) {
    return MacrosEntity(
      horror: doc['horror'],
      fun: doc['fun'],
      romance: doc['romance'],
      score: doc['score'],
    );
  }
}

