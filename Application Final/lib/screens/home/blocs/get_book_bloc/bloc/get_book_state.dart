part of 'get_book_bloc.dart';

abstract class GetBookState extends Equatable {
  const GetBookState();

  @override
  List<Object?> get props => [];
}

class GetBookInitial extends GetBookState {}

class GetBookLoading extends GetBookState {}

class GetBookSuccess extends GetBookState {
  final List<Book> books;

  const GetBookSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class GetBookFailure extends GetBookState {}


