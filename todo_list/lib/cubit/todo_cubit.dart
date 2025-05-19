import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_models.dart';

class TodoCubit extends Cubit<List<TodoModels>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final newTodo = TodoModels(title: title, createdAt: DateTime.now());
    emit([...state, newTodo]);
  }
}
