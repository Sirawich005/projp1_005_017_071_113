import 'package:bloc/bloc.dart';
import 'package:book_repository/book_repository.dart';
import 'package:equatable/equatable.dart';


part 'get_book_event.dart';
part 'get_book_state.dart';

class GetBookBloc extends Bloc<GetBookEvent, GetBookState> {
  final BookRepo _bookRepository;

  GetBookBloc(this._bookRepository) : super(GetBookInitial()) {
    on<GetBook>((event, emit) async {
      emit(GetBookLoading());
      try {
        final books = await _bookRepository.getBooks();
        emit(GetBookSuccess(books));
      } catch (_) {
        emit(GetBookFailure());
      }
    });

    on<GetAdventureBooks>((event, emit) async {
      emit(GetBookLoading());
      try {
        final allBooks = await _bookRepository.getBooks();
        final adventureBooks = allBooks.where((book) => book.isAdventure).toList(); // Assuming `isAdventure` is a bool property of your Book model
        emit(GetBookSuccess(adventureBooks));
      } catch (_) {
        emit(GetBookFailure());
      }
    });

    on<GetFinancialBooks>((event, emit) async {
      emit(GetBookLoading());
      try {
        final allBooks = await _bookRepository.getBooks();
        final financialBooks = allBooks.where((book) => book.isFinance).toList(); // Assuming `isFinance` is a bool property of your Book model
        emit(GetBookSuccess(financialBooks));
      } catch (_) {
        emit(GetBookFailure());
      }
    });
  }
}
