import 'package:bloc/bloc.dart';

// Определяем состояние закладки
enum BookmarkState { bookmarked, notBookmarked }

class NotBook extends Cubit<BookmarkState> {
  NotBook() : super(BookmarkState.notBookmarked);

  // Метод для добавления или удаления закладки
  void toggleBookmark() {
    // Изменяем состояние кубита в зависимости от текущего состояния
    if (state == BookmarkState.bookmarked) {
      emit(BookmarkState.notBookmarked); // Удаляем закладку
    } else {
      emit(BookmarkState.bookmarked); // Добавляем закладку
    }
  }
}
