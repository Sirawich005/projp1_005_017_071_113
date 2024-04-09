import 'dart:developer';

import 'package:book_repository/book_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBookRepo implements BookRepo{
  final bookCollection = FirebaseFirestore.instance.collection('books');

  @override
  Future<List<Book>> getBooks() async{
    try{
      return await bookCollection
      .get()
      .then((value) => value.docs.map((e) => Book.fromEntity(BookEntity.fromDocument(e.data()))
      ).toList());
    }catch(e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<List<Book>> getAdventureBooks() async {
    try{
      return await bookCollection
      .get()
      .then((value) => value.docs.map((e) => Book.fromEntity(BookEntity.fromDocument(e.data()))
      ).toList());
    }catch(e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<List<Book>> getFinancialBooks() async {
    try{
      return await bookCollection
      .get()
      .then((value) => value.docs.map((e) => Book.fromEntity(BookEntity.fromDocument(e.data()))
      ).toList());
    }catch(e) {
      log(e.toString());
      rethrow;
    }
  }
  
}