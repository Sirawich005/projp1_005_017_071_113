part of 'get_book_bloc.dart';

abstract class GetBookEvent extends Equatable {
  const GetBookEvent();

  @override
  List<Object?> get props => [];
}

class GetBook extends GetBookEvent {}

class GetAdventureBooks extends GetBookEvent {}

class GetFinancialBooks extends GetBookEvent {}
